// Для описания содержимого корзины

import Foundation

struct GetContentsBasketRequest {
    
    var userId: Int = 0
    
    init(_ json: [String: AnyObject]) {
        
        if let userId = json["id_user"] as? Int {
            self.userId = userId
        }
    }
}
