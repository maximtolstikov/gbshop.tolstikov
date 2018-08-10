// Для добавления функциональность для StackView

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ subviews: [UIView]) {
        
        subviews.forEach { addArrangedSubview( $0 ) }
    }
    
    
    func removeAllArrangedSubviews() {
        
        arrangedSubviews.forEach {
            $0.removeFromSuperview()
            removeArrangedSubview($0)
        }
    }
    
    
    func addArrangedSubviewIfNotNil(_ subview: UIView?) {
        
        if let view = subview {
            addArrangedSubview(view)
        }
    }
}
