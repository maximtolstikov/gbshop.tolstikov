// Для (регистрации) изменения данных пользователя

import UIKit

class UserDataFormViewController: UIViewController, TrackableMixin {
    
    @IBOutlet weak var naviItem: UINavigationItem!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var cardTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var bioTV: UITextView!
    
    var requestFactory: RequestFactory?
    var request: AuthRequest?
    
    var controller: Controllers = .changeUserDataViewController
    var userData: UserData?
    let keyboardNotification = KeyboardNotification()
    let userDefaults = UserDefaults.standard
    
    let wrongResponse = "Сервер не отвечает!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboardNotification.scrollView = scrollView
        keyboardNotification.registerForKeyboardNotification()
    }
    
    // Заполняем данными формы
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        naviItem.title = controller.rawValue
        insertDataInForm()
        requestFactory = RequestFactory()
        request = requestFactory?.makeAuthRequestFactory() as? AuthRequest
    }
    
    // отписываемся от уведомлений клавиатуры
    deinit {
        
        keyboardNotification.removeKetboardNotifiction()
    }
    
    
    // MARK: - Получение, установка данных формы
    func insertDataInForm() {
        
        guard let data = userData else { return }
        
        loginTF.text = data.login
        passwordTF.text = data.password
        cardTF.text = data.creditCard
        genderTF.text = data.gender
        emailTF.text = data.email
        bioTV.text = data.bio
    }
    
    
    func collectData() -> UserData? {
        
        // TODO: - изменить присваевание userID, добавить остальные поля
        //userData.idUser = 123
        
        if let login = loginTF.text,
            let password = passwordTF.text {
            
            let userData = UserData(
                withLogin: login,
                password: password)
            
            return userData
        }
        return nil
    }
    
    
    // MARK: - запросы на сервер
    
    // Запрос на сервер на регистрацию
    func requestRegistration(withData data: UserData) {
        
        request?.registration(forUser: data) { (response) in
            guard let result = response.result.value else { return }
            
            if result.result == 1 {
                
                let key = UserDefaultsKey.isRegistration.rawValue
                self.userDefaults.set(true, forKey: key)
                self.track(.registration())
                let viewController = self.presentedViewController
                
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: {
                        viewController?.viewDidAppear(true)
                    })
                }
                
            } else {
                
                DispatchQueue.main.async {
                    self.showAlert(
                        title: "",
                        message: result.message,
                        viewController: self)
                }
            }
        }
    }
    
    
    // Запрос на сервер на измение данных
    func requestChangeUserData(withData data: UserData) {
        
        request?.changeData(forUser: data) { (response) in
            guard let result = response.result.value else { return }
            
            if result.result == 1 {
                
                let storyboard = UIStoryboard(name: "ProductStoreStoryboard", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "productListCell")
                
                DispatchQueue.main.async {
                    self.present(
                        viewController,
                        animated: true,
                        completion: nil)
                }
                
            } else {
                
                DispatchQueue.main.async {
                    self.showAlert(
                        title: self.wrongResponse,
                        message: "",
                        viewController: self)
                }
                
            }
        }
    }
    
    
    // MARK: - Методы кнопок
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        
        guard let userData = collectData() else { return }
        
        switch controller {
        case .changeUserDataViewController:
            requestChangeUserData(withData: userData)
        case .registrationViewController:
            requestRegistration(withData: userData)
        }
        
    }
}
