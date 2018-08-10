/* ??? */

import Alamofire

protocol ProductStoreRequestFactory {
    
    func getAllGoods(
        page: Int,
        idCategory: Int,
        completionHandler: @escaping (DataResponse<AllGoodsResult>) -> Void)
    
    
    func getGoodById(
        idProduct: Int,
        completionHandler: @escaping (DataResponse<ProductResult>) -> Void)
}
