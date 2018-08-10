// Для подмешивания методов аналитики

import Crashlytics
import Foundation

enum AnaliticsEvent {
    
    enum LoginMethod: String {
        case qrCode
        case password
    }
    
    case login(method: LoginMethod, success: Int)
    case logout()
    case registration()
    case openProductList()
    case openProductDetail()
    case addProductInBasket()
    case deleteProductFromBasket()
    case payOrder()
    case addOpinion()
    
}


protocol TrackableMixin {
    
    func track(_ event: AnaliticsEvent)
}


extension TrackableMixin {
    
    func track(_ event: AnaliticsEvent) {
        
        switch event {
            
        case let .login(method, success):
            Answers.logLogin(
                withMethod: method.rawValue,
                success: success as NSNumber,
                customAttributes: nil
            )
        case .logout:
            Answers.logSignUp(
                withMethod: "Logout",
                success: true as NSNumber,
                customAttributes: nil
            )
        case .registration:
            Answers.logCustomEvent(
                withName: "Registration",
                customAttributes: nil
            )
        case .openProductList:
            Answers.logCustomEvent(
                withName: "OpenProductList",
                customAttributes: nil
            )
        case .openProductDetail:
            Answers.logCustomEvent(
                withName: "OpenProductDetail",
                customAttributes: nil
            )
        case .addProductInBasket:
            Answers.logCustomEvent(
                withName: "AddProductInBasket",
                customAttributes: nil
            )
        case .deleteProductFromBasket:
            Answers.logCustomEvent(
                withName: "BeleteProductFromBasket",
                customAttributes: nil
            )
        case .payOrder:
            Answers.logCustomEvent(
                withName: "PayOrder",
                customAttributes: nil
            )
        case .addOpinion:
            Answers.logCustomEvent(
                withName: "AddOpinion",
                customAttributes: nil
            )
        }
    }
}
