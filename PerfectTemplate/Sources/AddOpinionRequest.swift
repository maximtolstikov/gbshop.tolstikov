
import Foundation

struct AddOpinionRequest {
    
    var idUser: Int = 0
    var text: String = ""
    
    init(_ json: [String: AnyObject]) {
        
        if let idUser = json["id_user"] as? Int {
            self.idUser = idUser
        }
        if let text = json["text"] as? String {
            self.text = text
        }
    }
}
