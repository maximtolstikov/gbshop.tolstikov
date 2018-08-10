/* Структура для представления ответа сервера */

struct DeleteOpinionResult: Codable {
    
    let result: Int
    let message: String
    
}
