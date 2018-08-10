// Для настройки контроллера карзины заказов

import UIKit

class BasketViewController: UIViewController, TrackableMixin {
    
    @IBOutlet weak var stackOrder: UIStackView!
    
    var payUnsuccess = "Оплата не прошла!"
    var wrongRequest = "Сервер не отвечает!"
    var paySuccess = "Заказ оплачен!"
    var userId = 01
    
    var requestFactory: RequestFactory?
    var request: OrdersRequest?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestFactory = RequestFactory()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        updateBasket()
    }
    
    
    // MARK: - настройка контроллера
    
    // Обновление данных корзины
    fileprivate func updateBasket() {        
        
        getContentsBasket(completion: { [weak self] (list) in
            DispatchQueue.main.async {
                self?.addOrderInStack(orderList: list)
            }
        })
    }
    
    
    // Добавляет полученные данные в стек
    fileprivate func addOrderInStack(orderList: [String]) {
        
        stackOrder.removeAllArrangedSubviews()
        
        for name in orderList {
            let orderView = Order.loadFromNib()
            
            if let view = orderView {
                view.textLable = name
                stackOrder.addArrangedSubview(view)
            }
            
        }
    }

    
    // MARK: - запросы на сервер
    
    fileprivate func getContentsBasket(completion: @escaping ([String]) -> Void) {
        
        request = requestFactory?.makeOrdersRequestFactory() as? OrdersRequest
        request?.getContentsBasket(forUser: userId, completionHandler: { (response) in
            guard let result = response.result.value else { return }
            let resultStatus = result.result
            switch resultStatus {
            case 0:
                DispatchQueue.main.async {
                    self.showAlert(
                        title: self.wrongRequest,
                        message: "",
                        viewController: self)
                }
            case 1:
                let listProducts = result.message
                completion(listProducts)
            default:
                break
            }
        })
    }
    
    
    fileprivate func sendPayOrder(completion: @escaping (OrderPaymentResult) -> Void) {
        
        request = requestFactory?.makeOrdersRequestFactory() as? OrdersRequest
        request?.payment(completionHandler: { (response) in
            guard let result = response.result.value else {
                
                DispatchQueue.main.async {
                    self.showAlert(
                        title: self.payUnsuccess,
                        message: "",
                        viewController: self)
                }
                return }
            
            completion(result)
        })
    }
    
    
    // MARK: - Методы кнопок
    
    // нажатие на кнопку оплата заказа
    @IBAction func payOrderButton(_ sender: UIButton) {
        
        sendPayOrder { [weak self] (result) in
            
            if result.result == 1 {
                
                self?.track(.payOrder())
                
                DispatchQueue.main.async {
                    self?.showAlert(
                        title: result.message,
                        message: "",
                        viewController: self!)
                }
                
                self?.updateBasket()
            } else {
                
                DispatchQueue.main.async {
                    
                    self?.showAlert(
                        //swiftlint:disable:next force_unwrapping
                        title: (self?.wrongRequest)!, 
                        message: "",
                        viewController: self!)
                }
            }
        }
    }
    
}
