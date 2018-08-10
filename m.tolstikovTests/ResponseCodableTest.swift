/* Класс для теста обработки запроса */

import Alamofire
import XCTest
@testable import m_tolstikov //swiftlint:disable:this sorted_imports

class ResponseCodableTest: XCTestCase {
    
    let expectation = XCTestExpectation(description: "wait response from server")
    let errorParser = ErrorParserStab()
    
    struct PostStub: Codable {
        let userId: Int
        let id: Int
        let title: String
        let body: String
    }
    
    enum ApiErrorStab: Error {
        case fatalError
    }    
    
    struct ErrorParserStab: AbstractErrorParser {
        func parse(_ result: Error) -> Error {
            return ApiErrorStab.fatalError
        }
        
        func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
            return error
        }
    }

    
    func testShouldDownloadAndParse() {
        
        Alamofire
            .request("https://jsonplaceholder.typicode.com/posts/1")
            .responseCodable(errorParser: errorParser) { (response: DataResponse<PostStub>) -> Void in
                switch response.result {
                case .success(_):             //swiftlint:disable:this empty_enum_arguments
                    break
                case .failure(_):             //swiftlint:disable:this empty_enum_arguments
                    XCTFail()                 //swiftlint:disable:this xctfail_message
                }
                self.expectation.fulfill()
        }                                     //swiftlint:disable:this closure_end_indentation
        
        wait(for: [expectation], timeout: 1)
    }
    
}
