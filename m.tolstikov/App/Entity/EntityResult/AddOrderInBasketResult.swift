/* Структура для представления ответа сервера добавлен ли заказ */

struct AddOrderInBasketResult: Codable {
    
    let result: Int
    let message: String
    
}
