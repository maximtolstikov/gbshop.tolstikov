/*  ??? */

import Alamofire

protocol OrdersRequestFactory {
    
    func addToBasket(completionHandler: @escaping (DataResponse<AddOrderInBasketResult>) -> Void)
    
    func deleteFromBasket(completionHandler: @escaping (DataResponse<RemoveOrderResult>) -> Void)
    
    func payment(completionHandler: @escaping (DataResponse<OrderPaymentResult>) -> Void)
    
    func getContentsBasket(
        forUser id: Int,
        completionHandler: @escaping (DataResponse<ContentsBasketResulеt>) -> Void)
}
