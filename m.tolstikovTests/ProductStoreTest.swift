/* Класс который тестирует методы получения одного и всех продуктов */

import XCTest
@testable import m_tolstikov //swiftlint:disable:this sorted_imports

class ProductStoreTest: XCTestCase {
    
    var requestFactory: RequestFactory?
    var request: ProductStoreRequest?
    let expectation = XCTestExpectation(description: "wait response from servet")
    
    
    override func setUp() {
        super.setUp()
        
        requestFactory = RequestFactory()
        request = requestFactory?.makeProductStoreRequestFactory() as? ProductStoreRequest
    }
    
    
    override func tearDown() {
        super.tearDown()
        
        requestFactory = nil
        request = nil
    }
    
    
    func testGetAllGoods() {
        
        request?.getAllGoods(page: 1, idCategory: 1) { (response) in
            
            print(response.debugDescription)
            
            let response = response.result.value
            XCTAssertNotNil(response)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    
    func testGetGoodById() {
        
        request?.getGoodById(idProduct: 1) { (response) in
            
            
            print(response.debugDescription)
            
            let response = response.result.value?.result
            XCTAssertEqual(response, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
