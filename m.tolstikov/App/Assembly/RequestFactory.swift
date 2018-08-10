/* Класс для сборки конкретных фабрик */

import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let manager = SessionManager(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    // Создание фабрики по работе с авторизацией (регистрацией) пользователя
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return AuthRequest(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
        )
    }
    
    
    // Создание фабрики по работе с товарами
    
    func makeProductStoreRequestFactory() -> ProductStoreRequestFactory {
        let errorParser = makeErrorParser()
        return ProductStoreRequest(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
        )
    }
    
    // Создание фабрики по работе с отзывами
    
    func makeOpinionsRequestFactory() -> OpinionsRequestFactory {
        let errorParser = makeErrorParser()
        return OpinionRequest(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
        )
    }
    
    // Создание фабрики по работе с товарами
    
    func makeOrdersRequestFactory() -> OrdersRequestFactory {
        let errorParser = makeErrorParser()
        return OrdersRequest(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
        )
    }
}
