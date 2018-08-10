// Для расширения функционольности UIView

import UIKit

extension UIView {
    
    // загружает View из Nib файла
    
    class func loadFromNib() -> Self? {
        
        let selfClass: AnyClass = self as AnyClass
        var className: String = NSStringFromClass(selfClass)
        let bundle = Bundle(for: selfClass)
        
        //swiftlint:disable:next control_statement
        if (bundle.path(forResource: className, ofType: "nib") == nil) {
            className = (className as NSString).pathExtension
            //swiftlint:disable:next control_statement
            if (bundle.path(forResource: className, ofType: "nib") == nil) {
                return nil
            }
        }
        return view(bundle, className: className)
    }
    
    
    private class func view<T>(_ bundle: Bundle, className: String) -> T? {
        
        guard let nibContents = bundle.loadNibNamed(className, owner: nil, options: nil) else {
            return nil }
        
        var view: UIView?
        
        for obj in nibContents {
            if (obj as AnyObject).isKind(of: self) {
                view = obj as? UIView
                break
            }
        }
        return view as? T
    }
    
}
