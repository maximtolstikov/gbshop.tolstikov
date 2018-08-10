/* Структура для подставнки данных пользователя */

struct UserData {
    
    var idUser: Int = 01
    var login: String
    var password: String
    var email: String = "t@t.ru"
    var gender: String = "male"
    var creditCard: String = "0000"
    var bio: String = "any text"
    
    init() {
        
        self.login = "stub"
        self.password = "stub"
    }
    
    init(withLogin login: String, password: String) {
        
        self.login = login
        self.password = password
    }
}
