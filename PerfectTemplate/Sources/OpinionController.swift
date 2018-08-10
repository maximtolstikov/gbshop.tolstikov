import Foundation
import PerfectHTTP


class OpinionController {
    
    let addOpinion: (HTTPRequest, HTTPResponse) -> () = { request, response in
        
        guard let str = request.postBodyString, let data = str.data(using: .utf8) else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Wrong uset data!)"))
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            let registerRequest = AddOpinionRequest(json)
            print("Request - \(registerRequest)")
            
            try response.setBody(json: ["result": 1, "message": "Данные получены успешно!"])
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
    
    let deleteOponion: (HTTPRequest, HTTPResponse) -> () = { request, response in
        
        guard let str = request.postBodyString, let data = str.data(using: .utf8) else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Wrong uset data!)"))
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            let registerRequest = DeleteOpinionRequest(json)
            print("Request - \(registerRequest)")
            
            try response.setBody(json: ["result": 1, "message": "Данные удалены успешно!"])
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
    
    let listOponion: (HTTPRequest, HTTPResponse) -> () = { request, response in
        
        guard let str = request.postBodyString, let data = str.data(using: .utf8) else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Wrong uset data!)"))
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            let registerRequest = ListOpinionRequest(json)
            print("Request - \(registerRequest)")
            
            try response.setBody(json: ["result": 1, "message": "Данные получены успешно!"])
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
}
