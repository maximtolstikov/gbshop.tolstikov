import Foundation

struct GetGoodByIdRequest {

    var idProduct: Int = 0
    
    init(_ json: [String: AnyObject]) {
        
        if let idProduct = json["id_product"] as? Int{
            self.idProduct = idProduct
        }
    }
}
