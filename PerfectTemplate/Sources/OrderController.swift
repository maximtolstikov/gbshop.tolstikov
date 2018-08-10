import Foundation
import PerfectHTTP


class OrderController {
    
    let addOrder: (HTTPRequest, HTTPResponse) -> () = { request, response in
        
        guard let str = request.postBodyString, let data = str.data(using: .utf8) else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Wrong uset data!)"))
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            let registerRequest = AddOrderRequest(json)
            print("Request - \(registerRequest)")
            
            try response.setBody(json: ["result": 1, "message": "Данные получены успешно!"])
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
    
    let deleteOrder: (HTTPRequest, HTTPResponse) -> () = { request, response in
        
        guard let str = request.postBodyString, let data = str.data(using: .utf8) else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Wrong uset data!)"))
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            let registerRequest = RemoveOrderRequest(json)
            print("Request - \(registerRequest)")
            
            try response.setBody(json: ["result": 1, "message": "Данные удалены успешно!"])
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
    
    let payment: (HTTPRequest, HTTPResponse) -> () = { request, response in
        
        guard let str = request.postBodyString, let data = str.data(using: .utf8) else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Wrong uset data!)"))
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            let registerRequest = OrderPaymentRequest(json)
            print("Request - \(registerRequest)")
            
            try response.setBody(json: ["result": 1, "message": "Данные получены успешно!"])
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
    
    
    
    let getBasket: (HTTPRequest, HTTPResponse) -> () = { request, response in
        
        guard let str = request.postBodyString, let data = str.data(using: .utf8) else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Wrong uset data!)"))
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            let registerRequest = OrderPaymentRequest(json)
            print("Request - \(registerRequest)")
            
            try response.setBody(json: ["result": 1, "message": ["Болты", "Шурупы", "Гвозди"]])
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
}

