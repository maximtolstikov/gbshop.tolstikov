/* Структура для представления ответа сервера оплачен ли заказ */

struct OrderPaymentResult: Codable {
    
    let result: Int
    let message: String
    
}
