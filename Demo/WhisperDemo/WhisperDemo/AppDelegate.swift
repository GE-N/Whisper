import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  lazy var navigationController: UINavigationController = UINavigationController(rootViewController: ViewController())

  lazy var fantribeEventsController: UINavigationController = UINavigationController(rootViewController: FantribeEventsVC())
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window = UIWindow()
//    window?.rootViewController = navigationController
    window?.rootViewController = fantribeEventsController
    window?.makeKeyAndVisible()

    return true
  }
}

