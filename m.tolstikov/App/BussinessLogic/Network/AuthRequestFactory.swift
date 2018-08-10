/* ??? */

import Alamofire

protocol AuthRequestFactory {
    
    func login(_ userData: UserData, completionHandler: @escaping ( DataResponse<LoginResult>) -> Void)
    
    func logout(completionHandler: @escaping (DataResponse<LogoutResult>) -> Void)
    
    func registration(
        forUser data: UserData,
        completionHandler: @escaping (DataResponse<RegistrationResult>) -> Void)
    
    func changeData(
        forUser data: UserData,
        completionHandler: @escaping (DataResponse<ChangeUserDataResult>) -> Void)
}
