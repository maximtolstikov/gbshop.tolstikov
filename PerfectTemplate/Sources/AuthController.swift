import Foundation
import PerfectHTTP

class AuthController {

    
    let register: (HTTPRequest, HTTPResponse) -> () = { request, response in
        
        guard let str = request.postBodyString, let data = str.data(using: .utf8) else {
            
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Wrong user data!)"))
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            guard let registerRequest = RegisterRequest(json) else {
                try response.setBody(json: ["result": 0, "message": "Запрос на регистрацию потерен!"])
                response.completed()
                return
            }

            let result = UserManager().addUser(request: registerRequest)
            
            try response.setBody(json: result)
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
        
    }
    
    
    let login: (HTTPRequest, HTTPResponse) -> () = { request, response in
        
        guard let str = request.postBodyString, let data = str.data(using: .utf8) else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Wrong uset data!)"))
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            guard let loginRequest = LoginRequest(json) else {
                try response.setBody(json: ["result": 0, "message": "Пользователь не авторизован!"])
                response.completed()
                return
            }
            print("Request - \(loginRequest)")
            
            let login = loginRequest.login
            let password = loginRequest.password
            
            let result = UserManager().checkUser(for: login, password: password)
            
            try response.setBody(json: result)
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
        
    }
    
    let logout: (HTTPRequest, HTTPResponse) -> () = { request, response in
        
        guard let str = request.postBodyString, let data = str.data(using: .utf8) else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Wrong uset data!)"))
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            guard let registerRequest = LogoutRequest(json) else {
                try response.setBody(json: ["result": 0, "message": "Пользователь не вышел!"])
                response.completed()
                return
            }
            print("Request - \(registerRequest)")
            
            try response.setBody(json: ["result": 1, "message": "Пользователь вышел!"])
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
        
    }
    
    
    // Изменяет данные пользователя
    let changeUserData: (HTTPRequest, HTTPResponse) -> () = { request, response in
        
        guard let str = request.postBodyString, let data = str.data(using: .utf8) else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Wrong uset data!)"))
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            guard let registerRequest = ChangeUserDataRequest(json) else {
                try response.setBody(json: ["result": 0, "message": "Данные изменены не  успешно!"])
                response.completed()
                return
            }
            print("Request - \(registerRequest)")
            
            try response.setBody(json: ["result": 1, "message": "Данные изменены успешно!"])
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }        
    }
}
