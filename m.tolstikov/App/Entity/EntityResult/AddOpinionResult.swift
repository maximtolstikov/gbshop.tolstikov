/* Структура для представления ответа сервера */

struct AddOpinionResult: Codable {
    
    let result: Int
    let message: String
    
}
