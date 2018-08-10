import PerfectHTTP
import PerfectHTTPServer

let server = HTTPServer()
let authController = AuthController()
let productStoreController = ProductStoreController()
let opinionController = OpinionController()
let orderController = OrderController()
var routes = Routes()

routes.add(method: .post, uri: "/register", handler: authController.register)
routes.add(method: .post, uri: "/login", handler: authController.login)
routes.add(method: .post, uri: "/logout", handler: authController.logout)
routes.add(method: .post, uri: "/change_user_data", handler: authController.changeUserData)
routes.add(method: .post, uri: "/get_all_goods", handler: productStoreController.getAllGoods)
routes.add(method: .post, uri: "/get_good_by_id", handler: productStoreController.getGoodById)
routes.add(method: .post, uri: "/add_review", handler: opinionController.addOpinion)
routes.add(method: .post, uri: "/remove_review", handler: opinionController.deleteOponion)
routes.add(method: .post, uri: "/list_review", handler: opinionController.listOponion)
routes.add(method: .post, uri: "/add_order", handler: orderController.addOrder)
routes.add(method: .post, uri: "/remove_order", handler: orderController.deleteOrder)
routes.add(method: .post, uri: "/payment_order", handler: orderController.payment)
routes.add(method: .post, uri: "/get_basket", handler: orderController.getBasket)


server.addRoutes(routes)
server.serverPort = 8080

do {
    try server.start()
} catch {
    fatalError("Network error: \(error)")
}
