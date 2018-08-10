import Foundation

struct GetAllGoodsRequest {

    var idCategory: Int = 0
    var pageNumber: Int = 0
    
    init(_ json: [String: AnyObject]) {

        if let idCategory = json["id_category"] as? Int{
            self.idCategory = idCategory
        }
        if let pageNumber = json["page_number"] as? Int{
            self.pageNumber = pageNumber
        }
    }
}
