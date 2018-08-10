import Alamofire


enum RequestRouterEncoding {
    case url, json
}


protocol RequestRouter: URLRequestConvertible {
    
    var baseUrl: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var fullURL: URL { get }
    var encoding: RequestRouterEncoding { get }
}


extension RequestRouter {
    
    var fullURL: URL {
        return baseUrl.appendingPathComponent(path)
    }
    var encoding: RequestRouterEncoding {
        let encoding: RequestRouterEncoding
        switch self.method {
        case .get:
            encoding = .url
        case .post:
            encoding = .json
        case .put:
            encoding = .json
        default:
            encoding = .url
        }
        return encoding
    }
    
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: fullURL)
        urlRequest.httpMethod = method.rawValue
        
        switch self.encoding {
        case .url:
            return try URLEncoding.default.encode(urlRequest, with: parameters)
        case .json:
            return try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }
}
