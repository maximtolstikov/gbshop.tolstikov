import Foundation
import PerfectHTTP

class ProductStoreController {
    
    let getAllGoods: (HTTPRequest, HTTPResponse) -> () = { request, response in
        
        guard let str = request.postBodyString, let data = str.data(using: .utf8) else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Wrong user data!)"))
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            let registerRequest = GetAllGoodsRequest(json)
            print("Request - \(registerRequest)")
            
            let products = [
                ["idProduct": 1, "name": "Гвозди", "cost": 5, "opinions": ["Хорошие гвозди!", "Мне гвозди понравились!", "Фигня :("]],
                ["idProduct": 2, "name": "Болты", "cost": 3, "opinions": ["Тяжело закручваются!", "Мне болты понравились!", "всё ОК!"]],
                ["idProduct": 3, "name": "Шурупы", "cost": 8, "opinions": ["Нормальные шурупы!", "Мне гвозди понравились!", "Хорошо крутят!"]]
            ]
   
            // Хотел  отправлять JSON из объектов
//            let product = Product(idProduct: 1, name: "test", coast: 5)
//
//            let encoder = JSONEncoder()
//            let jsonEncode = try? encoder.encode(product)
//            let jsonString = String(data: jsonEncode!, encoding: .utf8)
            

            
            try response.setBody(json: ["result": 1, "products": products])
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
    
    let getGoodById: (HTTPRequest, HTTPResponse) -> () = { request, response in
        
        guard let str = request.postBodyString, let data = str.data(using: .utf8) else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Wrong uset data!)"))
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            let registerRequest = GetGoodByIdRequest(json)
            print("Request - \(registerRequest)")
            
            try response.setBody(json: ["result": 1, "message": "Данные получены успешно!"])
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
}

