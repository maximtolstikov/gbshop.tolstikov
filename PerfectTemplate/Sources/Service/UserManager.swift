// Для обработки вариантов авторизации, аунтетификации, регистрации Пользователя

import Foundation

protocol BDManager {
    
    func write(for dict: [String: [String: Any]]) -> [String: Any]
    func getDict() -> [String: [String: Any]]?
}

struct UserManager {
    
    let bdManager: BDManager
    
    init() {
        self.bdManager = PlistManager()
    }
    
    
    // Принемает содержащий данные пользователя реквест, преобразует его
    // в нужный словарь и сохраняет его в базу
    func addUser(request: RegisterRequest) -> [String: Any] {
        
        guard let dictFromBD = bdManager.getDict() else {
            let error = "Файл базы данных недоступен!"
            print(error)
            return ["result": 0, "message": error] }
        
        if dictFromBD[request.login] != nil {
            let error = "Пользователь с таким именем уже существует!"
            print(error)
            return ["result": 0, "message": error]
        }
        
        var dict = [String: [String: Any]]()
        let array = makeArrayUserData(object: request)
        dict[request.login] = array
        
        let message = bdManager.write(for: dict)
        return message
    }
    
    
    // Проверяет существует ли пользователь и правильный ли пароль
    func checkUser(for login: String, password: String) -> [String: Any] {
        
        guard let dict = bdManager.getDict() else {
            let error = "Файл базы данных недоступен!"
            print(error)
            return ["result": 0, "message": error] }
        
        if let content = dict[login] {

            let pass = content["password"] as? String

            if pass == password {
                let message = "Пользователь найден!"
                print(message)
                return ["result": 1, "message": message]
            } else {
                let error = "Пароль введен не верно!"
                print(error)
                return ["result": 0, "message": error]
            }
            
        } else {
            let error = "Пользователь не найден!"
            print(error)
            return ["result": 0, "message": error]
        }
    }
    
    
    // Создает массив словарей из объекта для сохранения в .plist
    fileprivate func makeArrayUserData(object: RegisterRequest) -> [String: Any] {
        
        var arrayContent = [String: Any]()
        arrayContent = [
            "password": object.password,
            "email": object.email,
            "gender": object.gender,
            "creditCard": object.creditCard,
            "bio": object.bio,
            "idUser": object.idUser
        ]
        
        return arrayContent
    }
    
}
