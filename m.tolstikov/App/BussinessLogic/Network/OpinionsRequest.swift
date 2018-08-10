/* Класс для реализации запросов отзывов */

import Alamofire

class OpinionRequest: BaseRequestClass, OpinionsRequestFactory {
    
    // Добавление отзыва
    
    func addOpinion(completionHandler: @escaping (DataResponse<AddOpinionResult>) -> Void) {
        
        let requestModel = AddOpinion(baseUrl: baseUrl, userData: UserData())
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    struct AddOpinion: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "add_review"
        let userData: UserData
        var parameters: Parameters? {
            return [ "id_user": userData.idUser,
                     "text": userData.bio
            ]
        }
    }

    // Удаление отзыва
    
    func deleteOpinion(completionHandler: @escaping (DataResponse<DeleteOpinionResult>) -> Void) {
        let requestModel = AddOpinion(baseUrl: baseUrl, userData: UserData())
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    struct DeleteOpinion: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "remove_review"
        let idComment = 0
        var parameters: Parameters? {
            return [
                "id_comment": idComment
            ]
        }
    }
    
    // Получение списка отзывов
    
    func listOpinion(completionHandler: @escaping (DataResponse<ListOpinionResult>) -> Void) {
        
        let requestModel = AddOpinion(baseUrl: baseUrl, userData: UserData())
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    struct ListOpinion: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "list_review"
        let userData: UserData
        var parameters: Parameters? {
            return [
                "id_user": userData.idUser
            ]
        }
    }
    
}
