/* Структура для представления ответа сервера удален ли заказ */

struct RemoveOrderResult: Codable {
    
    let result: Int
    let message: String
    
}
