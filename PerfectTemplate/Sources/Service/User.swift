/* Структура для подставнки данных пользователя */

struct User {
    
    var idUser: Int = 01
    var login: String
    var password: String
    var email: String = ""
    var gender: String = ""
    var creditCard: String = ""
    var bio: String = ""
    
    init(withLogin login: String, password: String) {
        
        self.login = login
        self.password = password
    }
}
