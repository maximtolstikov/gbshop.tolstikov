/* Класс реализации запросов добавления, удаления и оплаты заказа */

import Alamofire

class OrdersRequest: BaseRequestClass, OrdersRequestFactory {
   
    // Добавление заказа в корзину
    
    func addToBasket(completionHandler: @escaping (DataResponse<AddOrderInBasketResult>) -> Void) {
        
        let requestModel = AddOrder(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    struct AddOrder: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "add_order"
        var parameters: Parameters? {
            return [
                "id_order": 0
            ]
        }
    }
    
    // Удаление заказа из корзины
    
    func deleteFromBasket(completionHandler: @escaping (DataResponse<RemoveOrderResult>) -> Void) {
        let requestModel = DeleteOrder(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    struct DeleteOrder: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "remove_order"
        let idComment = 0
        var parameters: Parameters? {
            return [
                "id_order": 0
            ]
        }
    }
    
    // Оплата заказа
    
    func payment(completionHandler: @escaping (DataResponse<OrderPaymentResult>) -> Void) {
        
        let requestModel = PaymentOrder(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    struct PaymentOrder: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "payment_order"
        var parameters: Parameters? {
            return [
                "id_order": 0
            ]
        }
    }
    
    // Получения содержимого корзины

    func getContentsBasket(
        forUser id: Int,
        completionHandler: @escaping (DataResponse<ContentsBasketResulеt>) -> Void) {
        
        let requestModel = ContentBaskets(userId: id, baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    struct ContentBaskets: RequestRouter {
        let userId: Int
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "get_basket"
        var parameters: Parameters? {
            return [
                "id_user": 0
            ]
        }
    }
}
