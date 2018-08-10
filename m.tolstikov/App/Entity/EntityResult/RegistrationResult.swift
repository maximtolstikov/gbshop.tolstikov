/* Структура для представления ответа сервера */

struct RegistrationResult: Codable {
    
    let result: Int
    let message: String
    
}
