// Для определения модели продукта и списка продуктов

import Foundation

struct Product: Codable {
    
    var idProduct: Int
    var name: String
    var coast: Int
}


//struct Products: Codable{
//    
//   
//    
//    func getList() -> Product{
//        
//         var list = Array<Product>()
//        
//        for (index, value) in tools.enumerated() {
//            let product = Product(idProduct: index, name: value, coast: index * 10)
//            list.append(product)
//        }
//        
//        
//        return Product(idProduct: 1, name: "test", coast: 10)
//    }
//    
//}

