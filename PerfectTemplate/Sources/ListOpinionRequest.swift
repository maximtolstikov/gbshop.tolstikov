import Foundation

struct ListOpinionRequest {
    
    var idUser: Int = 0
    
    init(_ json: [String: AnyObject]) {
        
        if let idUser = json["id_user"] as? Int {
            self.idUser = idUser
        }
    }
}
