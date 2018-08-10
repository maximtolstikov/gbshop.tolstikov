/* Класс который тестирует методы добавления удаления и получения комментариев*/

import XCTest
@testable import m_tolstikov   //swiftlint:disable:this sorted_imports

class OpinionsTest: XCTestCase {
    
    var requestFactory: RequestFactory?
    var request: OpinionRequest?
    let expectation = XCTestExpectation(description: "wait response from servet")
    
    override func setUp() {
        super.setUp()
        
        requestFactory = RequestFactory()
        request = requestFactory?.makeOpinionsRequestFactory() as? OpinionRequest
    }
    
    override func tearDown() {
        super.tearDown()
        
        requestFactory = nil
        request = nil
    }
    
    
    func testAddOpinion() {
        
        request?.addOpinion { (response) in
            
            print(response.debugDescription)
            
            let response = response.result.value?.result
            XCTAssertEqual(response, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    
    func testDeleteOpinion() {
        
        request?.deleteOpinion { (response) in
            
            print(response.debugDescription)
            
            let response = response.result.value?.result
            XCTAssertEqual(response, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    
    func testListOpinion() {
        
        request?.listOpinion { (response) in
            
            print(response.debugDescription)
            
            let response = response.result.value?.result
            XCTAssertEqual(response, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
}
