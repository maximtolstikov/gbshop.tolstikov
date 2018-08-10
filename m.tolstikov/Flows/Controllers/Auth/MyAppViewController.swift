// Для отображения данных пользователя

import UIKit

class MyAppViewController: UIViewController {

    @IBOutlet weak var loginLable: UILabel!
    @IBOutlet weak var passwordLable: UILabel!
    @IBOutlet weak var creditcardLable: UILabel!
    @IBOutlet weak var genderLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var bioTextView: UITextView!

    var userData: UserData?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        guard let data = userData else { return }
        loginLable.text = data.login
        passwordLable.text = data.password
        creditcardLable.text = data.creditCard
        genderLable.text = data.gender
        emailLable.text = data.email
        bioTextView.text = data.bio
        
    }
    
    // MARK: - Методы кнопок
    @IBAction func editButton(_ sender: UIBarButtonItem) {

        let storyboard = UIStoryboard(name: "AuthStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "userDataFormVC")
            as! UserDataFormViewController  //swiftlint:disable:this force_cast
        viewController.controller = .changeUserDataViewController
        
        DispatchQueue.main.async {
            self.present(
                viewController,
                animated: true,
                completion: nil)
        }
    }
}
