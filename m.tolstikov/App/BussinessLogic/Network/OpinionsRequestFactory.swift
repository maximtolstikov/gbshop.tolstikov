/*  ??? */

import Alamofire

protocol OpinionsRequestFactory {
    
    func addOpinion(completionHandler: @escaping (DataResponse<AddOpinionResult>) -> Void)
    
    func deleteOpinion(completionHandler: @escaping (DataResponse<DeleteOpinionResult>) -> Void)
    
    func listOpinion(completionHandler: @escaping (DataResponse<ListOpinionResult>) -> Void)
}
