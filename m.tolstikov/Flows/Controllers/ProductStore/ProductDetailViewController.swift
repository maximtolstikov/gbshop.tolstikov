// Для отображения экрана "О товаре"

import UIKit

class ProductDetailViewController: UIViewController, TrackableMixin {

    @IBOutlet weak var nameProductLable: UILabel!
    @IBOutlet weak var costProductLable: UILabel!
    @IBOutlet weak var chatListView: UIStackView!
    
    var product: Product?
    let titleNavigationBar = "О товаре"
    let titleBasketButton = "В корзину"
    let successMessage = "Товар добавлен в корзину!"
    let textNewOpinion = "New opinion......"
    
    var requestFactory: RequestFactory?
    var request: OrdersRequest?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        fillProductData()
        fitNavigatioBar()
        track(.openProductDetail())
    }

    
    // MARK: - создание отзывов
    
    // создает отзыв
    func createOpinion(withText text: String) {
        
        //Text Label
        let lable = UILabel()
        lable.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        lable.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        lable.backgroundColor = UIColor.white
        lable.text = text
        lable.textAlignment = .center
        
        addViewInStack(addIn: chatListView, view: lable)
    }
    
    
    // добавляет отзыв в стек
    func addViewInStack(addIn stack: UIStackView, view: UILabel) {
        stack.addArrangedSubview(view)
        stack.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    // MARK: - подготавливаем контроллер к отображению
    
    //заполняем данными информацию о товаре при загрузке контроллера
    func fillProductData() {
        
        let coast = product?.cost ?? 0
        nameProductLable.text = product?.name ?? ""
        costProductLable.text = String(coast) + " p."
        
        if let opinions = product?.opinions {
            for text in opinions {
                createOpinion(withText: text)
            }
        }
    }
    
    
    // Настраиваем навигэйшн бар (добавляем кнопку)
    fileprivate func fitNavigatioBar() {
        
        navigationItem.title = titleNavigationBar
        let item = UIBarButtonItem(title: titleBasketButton, style: .done, target: self, action: #selector(addInBasket))
        navigationItem.rightBarButtonItem = item
    }
    
    
    // MARK: - запрос на сервер
    func requestOnServer(
        completion: @escaping (AddOrderInBasketResult) -> Void) {
        
        requestFactory = RequestFactory()
        request = requestFactory?.makeOrdersRequestFactory() as? OrdersRequest
        request?.addToBasket(completionHandler: { (response) in
            guard let result = response.result.value else {
                
                DispatchQueue.main.async {
                    self.showAlert(
                        title: "Сервер не отвечает!",
                        message: "",
                        viewController: self)
                }
                return }
            
            completion(result)
        })
    }
    
    
    // MARK: - методы кнопок
    
    @IBAction func addOpinion(_ sender: UIButton) {
        
        // TODO: - сделать форму создания отзыва
        
        track(.addOpinion())
        createOpinion(withText: textNewOpinion)
    }
    
    
    // Действие "Добавить в корзину"
    @objc func addInBasket() {
        
        requestOnServer { [weak self] (result) in
            
            if result.result == 1 {
            
                // TODO: - здесь предпологается что
                // товар реально добавлен в корзину
                
                self?.track(.addProductInBasket())
                
                DispatchQueue.main.async {
                    self?.showAlert(
                        //swiftlint:disable:next force_unwrapping
                        title: (self?.successMessage)!, 
                        message: "",
                        viewController: self!)
                }
                
            } else {
                
                DispatchQueue.main.async {
                    self?.showAlert(
                        title: result.message,
                        message: "",
                        viewController: self!)
                }
            }
        }
    }
}
