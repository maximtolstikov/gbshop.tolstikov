import Crashlytics
import Fabric
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let requestFactory = RequestFactory()
    

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // Run Crashlitics
        Fabric.with([Crashlytics.self])
        Fabric.with([Answers.self])
        return true
    }

}
