import Foundation

struct RemoveOrderRequest {
    
    var idOrder: Int = 0
    
    init(_ json: [String: AnyObject]) {
        
        if let idOrder = json["id_order"] as? Int {
            self.idOrder = idOrder
        }
    }
}
