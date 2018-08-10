// Для отображения Alert Controller

import UIKit

extension UIViewController {
    
    
    func showAlert(title: String, message: String, viewController: UIViewController) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(action)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
}
