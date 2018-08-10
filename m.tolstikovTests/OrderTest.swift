/* Класс для тестов методов добавления, удаления и оплаты заказа */

import XCTest
@testable import m_tolstikov   //swiftlint:disable:this sorted_imports

class OrderTest: XCTestCase {
    
    var requestFactory: RequestFactory?
    var request: OrdersRequest?
    let expectation = XCTestExpectation(description: "wait response from servet")
    
    override func setUp() {
        super.setUp()
        
        requestFactory = RequestFactory()
        request = requestFactory?.makeOrdersRequestFactory() as? OrdersRequest
    }
    
    override func tearDown() {
        super.tearDown()

        requestFactory = nil
        request = nil
    }


    func testAddOrder() {

        request?.addToBasket { (response) in

            print(response.debugDescription)

            let response = response.result.value?.result
            XCTAssertEqual(response, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }


    func testDeleteOrder() {

        request?.deleteFromBasket { (response) in

            print(response.debugDescription)

            let response = response.result.value?.result
            XCTAssertEqual(response, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }


    func testPaymentOrder() {

        request?.payment { (response) in

            print(response.debugDescription)

            let response = response.result.value?.result
            XCTAssertEqual(response, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    
    // тестирует запрос Получение содержимого корзины
    func testGetContentsBasket() {
        
        request?.getContentsBasket(forUser: 123) { (response) in
            
            print(response.debugDescription)
            
            let response = response.result.value?.result
            XCTAssertEqual(response, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
}
