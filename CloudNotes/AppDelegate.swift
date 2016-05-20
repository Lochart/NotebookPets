
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
  
  var window: UIWindow?
  
  func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    if let splitController = window?.rootViewController as? UISplitViewController {
      splitController.delegate = self
    }
    return true
  }
}

