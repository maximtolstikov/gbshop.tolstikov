import Foundation

struct DeleteOpinionRequest {
    
    var idComment: Int = 0
    
    init(_ json: [String: AnyObject]) {
        
        if let idComment = json["id_comment"] as? Int {
            self.idComment = idComment
        }
    }
}
