// Для авторизации пользователя (проверка/регистрация)

import Crashlytics
import UIKit

class LoginViewController: UIViewController, TrackableMixin {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var requestFactory: RequestFactory?
    var request: AuthRequest?
    let keyboardNotification = KeyboardNotification()
    let userDefaults = UserDefaults.standard
    
    let wrongResponse = "Сервер не отвечает!"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboardNotification.scrollView = scrollView
        keyboardNotification.registerForKeyboardNotification()
        //userDefaults.set(false, forKey: "auth")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let key = UserDefaultsKey.isRegistration.rawValue
        if userDefaults.bool(forKey: key) {
            performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }

    
    // отписываемся от уведомлений клавиатуры
    deinit {
        
        keyboardNotification.removeKetboardNotifiction()
    }
    
    
    // MARK: - запрос на сервер
    func requestOnServer(
        data: UserData,
        completion: @escaping (LoginResult) -> Void) {
        
        requestFactory = RequestFactory()
        request = requestFactory?.makeAuthRequestFactory() as? AuthRequest
        request?.login(data, completionHandler: { (response) in
            guard let result = response.result.value else {
                
                DispatchQueue.main.async {
                    self.showAlert(
                        title: self.wrongResponse,
                        message: "",
                        viewController: self)
                }
                return }
            
            completion(result)
        })
    }
    
    
    // MARK: - Методы кнопок
    @IBAction func login(_ sender: UIButton) {
        
        // TODO: - настроить валидацию полей
        
        var user = UserData()
        guard let textLogin = loginTF.text,
            let textPassword = passwordTF.text
            else { return }
        user.login = textLogin
        user.password = textPassword
        
        requestOnServer(data: user) { [weak self] (result) in
            
            if result.result == 1 {
                
                self?.userDefaults.set(
                    true,
                    forKey: UserDefaultsKey.isRegistration.rawValue)
                self?.track(.login(method: .password, success: 1))
                
                DispatchQueue.main.async {

                    self?.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
                
            } else {
                
                self?.track(.login(method: .password, success: 0))
                
                DispatchQueue.main.async {
                    self?.showAlert(
                        title: result.message,
                        message: "",
                        viewController: self!)
                }
            }
        }
    }
    
    // После нажатия на кнопку "Регистрация" переход на форму заполнения полей
    @IBAction func registration(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "AuthStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "userDataFormVC")
            as! UserDataFormViewController  //swiftlint:disable:this force_cast
        viewController.controller = .registrationViewController
        
        DispatchQueue.main.async {
            self.present(
                viewController,
                animated: true,
                completion: nil)
        }
    }
    
}
