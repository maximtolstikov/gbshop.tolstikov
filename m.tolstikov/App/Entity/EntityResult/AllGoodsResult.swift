/* Структура для представления ответа сервера */

struct AllGoodsResult: Codable {
    
    let result: Int
    let products: [Product]
    
}
