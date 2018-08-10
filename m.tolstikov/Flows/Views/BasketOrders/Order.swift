// Для описания Order.xib

import UIKit

class Order: UIView {

    @IBOutlet weak var orderNameLable: UILabel!
    @IBOutlet weak var orderSwitch: UISwitch!
    
    var textLable: String {
        
        get {
            return orderNameLable.text ?? ""
        }
        
        set(newValue) {
            orderNameLable.text = newValue
        }
    }
}
