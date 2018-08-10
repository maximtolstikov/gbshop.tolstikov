/* Класс который тестирует методы авторизации выхода и регистрации пользователя */

import XCTest
@testable import m_tolstikov //swiftlint:disable:this sorted_imports

class AuthTest: XCTestCase {
    
    var requestFactory: RequestFactory?
    var request: AuthRequest?
    let expectation = XCTestExpectation(description: "wait response from server")
    
    
    override func setUp() {
        super.setUp()
        
        requestFactory = RequestFactory()
        request = requestFactory?.makeAuthRequestFactory() as? AuthRequest
    }
    
    
    override func tearDown() {
        super.tearDown()
        
        requestFactory = nil
        request = nil
    }
    
    
    // проверяет авторизацию
    func testLogin() {
        
        let userData = UserData(withLogin: "test7", password: "test")
        
        request?.login(userData) { (response) in
            
            let response = response.result.value?.result
            XCTAssertEqual(response, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    
    // проверяет выход
    func testLogout() {
        
        request?.logout { (response) in
            
            let response = response.result.value?.result
            XCTAssertEqual(response, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    
    // проверяет регистрацию
    func testRegistrationUser() {

        request?.registration(forUser: UserData(withLogin: "test7", password: "test")) { (response) in
                        
            let response = response.result.value?.result
            XCTAssertEqual(response, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    // проверяет изменение данных
    func testChangeUserData() {
        
        request?.changeData(forUser: UserData(withLogin: "test7", password: "test")) { (response) in
            
            let response = response.result.value?.result
            XCTAssertEqual(response, 1)
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
   
}
