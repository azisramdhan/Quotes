// SceneDelegate.swift (partial)
import UIKit
import QuotesUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let quotesListVC = QuotesListViewController()
        let navigationController = UINavigationController(rootViewController: quotesListVC)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
