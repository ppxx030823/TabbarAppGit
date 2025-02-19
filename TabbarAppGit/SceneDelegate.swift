import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // 创建窗口
        let window = UIWindow(windowScene: windowScene)
        let mainVC = MainViewController.createNavigationController()
        window.rootViewController = mainVC
        window.makeKeyAndVisible()
        self.window = window
    }
    func sceneDidDisconnect(_ scene: UIScene) {
        // 处理场景断开连接的逻辑
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // 处理场景变为活跃状态的逻辑
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // 处理场景即将失去活跃状态的逻辑
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // 处理场景即将进入前台的逻辑
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // 处理场景进入后台的逻辑
    }
}
