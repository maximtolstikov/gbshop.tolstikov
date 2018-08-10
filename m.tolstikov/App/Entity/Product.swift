// Для отображения списка продуктов

import Foundation

struct Product: Codable {
    
    var idProduct: Int
    var name: String
    var cost: Int
    var opinions: [String]
}
