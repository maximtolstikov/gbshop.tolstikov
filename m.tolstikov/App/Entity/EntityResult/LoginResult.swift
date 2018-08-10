/* Структура для представления ответа сервера при авторизации */

struct LoginResult: Codable {
    let result: Int
    let message: String
}
