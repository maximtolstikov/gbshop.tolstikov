// Для вкючения прокрутки при вызове клавиатуры

import Foundation
import UIKit

class KeyboardNotification {
    
    var scrollView: UIScrollView?
    
    
    // Отписывает уведомления клавиатуры
    func removeKetboardNotifiction() {
        
        NotificationCenter.default.removeObserver(
            self,
            name: Notification.Name.UIKeyboardWillShow,
            object: nil
        )
        NotificationCenter.default.removeObserver(
            self,
            name: Notification.Name.UIKeyboardWillHide,
            object: nil
        )
    }
    
    
    // Подписыватет под уведомления клавиатуры
    func registerForKeyboardNotification() {
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(kbWillShow),
            name: Notification.Name.UIKeyboardWillShow,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(kbWillHide),
            name: Notification.Name.UIKeyboardWillHide,
            object: nil
        )
    }
    
    
    @objc func kbWillShow(_ notification: Notification) {
        
        guard let userInfo = notification.userInfo else { return }
        //swiftlint:disable:next force_cast
        let kbFrameSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue)
            .cgRectValue
            .size
        //swiftlint:disable:next legacy_constructor
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbFrameSize.height, 0.0)
        
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    
    @objc func kbWillHide(_ notification: Notification) {
        
        let contentInsets = UIEdgeInsets.zero
        
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
}
