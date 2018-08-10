/* Структура для представления ответа сервера */

struct ProductResult: Codable {
    
    let result: Int
    let message: String
    
}
