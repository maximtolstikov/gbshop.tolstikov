/* Класс для реализации запросов авторизации выхода и регистрации пользователя */

import Alamofire

class AuthRequest: BaseRequestClass, AuthRequestFactory {
    
    
    // Авторизация пользователя
    
    func login(_ userData: UserData, completionHandler: @escaping (DataResponse<LoginResult>) -> Void) {
       
        let requestModel = Login(baseUrl: baseUrl, userData: userData)
        print(requestModel.fullURL)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "login"
        let userData: UserData
        var parameters: Parameters? {
            return [
                "id_user": userData.idUser,
                "login": userData.login,
                "password": userData.password
            ]
        }
    }
    
    // Выход пользователя
    
    func logout(completionHandler: @escaping (DataResponse<LogoutResult>) -> Void) {
        
        let requestModel = Logout(baseUrl: baseUrl, userData: UserData())
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "logout"
        let userData: UserData
        var parameters: Parameters? {
            return [ "id_user": userData.idUser ]
            
        }
    }

    // Регистрация пользователя
    
    func registration(
        forUser data: UserData,
        completionHandler: @escaping (DataResponse<RegistrationResult>) -> Void) {
        
        let requestModel = RegistrationData(
            baseUrl: baseUrl, userData: data)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    struct RegistrationData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "register"
        let userData: UserData
        var parameters: Parameters? {
            return [
                "id_user": userData.idUser,
                "login": userData.login,
                "password": userData.password,
                "email": userData.email,
                "gender": userData.gender,
                "credit_card": userData.creditCard,
                "bio": userData.bio
            ]
        }
    }
    
    
    // Изменение данных в профиле пользователя
    
    func changeData(
        forUser data: UserData,
        completionHandler: @escaping (DataResponse<ChangeUserDataResult>) -> Void) {
        
        let requestModel = ChangeUserData(
            baseUrl: baseUrl,
            userData: data)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
    
    struct ChangeUserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "change_user_data"
        let userData: UserData
        var parameters: Parameters? {
            return [
                "id_user": userData.idUser,
                "login": userData.login,
                "password": userData.password,
                "email": userData.email,
                "gender": userData.gender,
                "credit_card": userData.creditCard,
                "bio": userData.bio
            ]
        }
    }
}
