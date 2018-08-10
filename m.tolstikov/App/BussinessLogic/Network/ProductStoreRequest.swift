/* Класс для реализации запросов данных по продуктам */

import Alamofire

class ProductStoreRequest: BaseRequestClass, ProductStoreRequestFactory {
    
    // Получение списка продуктов
    
    func getAllGoods(
        page: Int,
        idCategory: Int,
        completionHandler: @escaping (DataResponse<AllGoodsResult>) -> Void) {
        
        let requestModel = AllGoods(
            baseUrl: baseUrl,
            pageNumber: page,
            idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    struct AllGoods: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "get_all_goods"
        let pageNumber: Int
        let idCategory: Int
        var parameters: Parameters? {
            return [ "page_number": pageNumber,
                     "id_category": idCategory
            ]
        }
    }
    
    // Получение продукта по его ID
    
    func getGoodById(
        idProduct: Int,
        completionHandler: @escaping (DataResponse<ProductResult>) -> Void) {
        
        let requestModel = Product(
            baseUrl: baseUrl,
            idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    struct Product: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "get_good_by_id"
        let idProduct: Int
        var parameters: Parameters? {
            return [ "id_product": idProduct ]
        }
    }
}
