//
//  APPFactory.swift
//  TabbarAppGit
//
//  Created by ppx on 2025/2/17.
//

import UIKit

class AppAppearanceConfigurator {
    static func configureGlobalAppearance() {
        // 设置 UITabBar 外观
        UITabBar.appearance().barTintColor = .clear
        UITabBar.appearance().tintColor = .clear

        // 设置 UINavigationBar 外观
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .red
//        navigationBarAppearance.tintColor = .red
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.red]

        // 尝试从项目资源中获取名为 "allen" 的图片
        if let shadowImage = UIImage(named: "allen") {
            // 设置导航栏的阴影图片
            navigationBarAppearance.shadowImage = shadowImage
        }

        // 将配置应用到标准外观
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        // 将配置应用到滚动边缘外观（iOS 15+）
        if #available(iOS 15.0, *) {
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
}


// 视图控制器工厂类
class ViewControllerFactory {
    static func createTabBarController() -> UITabBarController {
        let (firstTabVC, secondTabVC, thirdVC) = setupCells()
        return makeTabBarAppearance(firstTabVC: firstTabVC, secondTabVC: secondTabVC, thirdVC: thirdVC)
    }

    static func setupCells() -> (FirstTabViewController, SecondTabViewController, ThirdViewController) {
        // 从数据管理类获取数据
        let tabBarViewDataModel = AppDataManager.shared.getTabBarViewDataModel()

        let articles = AppDataManager.shared.getArticles()
        let firstTabViewModel = FirstTabViewModel(articles: articles)
        let firstTabVC = FirstTabViewController(viewModel: firstTabViewModel)
        firstTabVC.tabBarItem.image = UIImage(named: tabBarViewDataModel[0].tabBarName)

        let secondViewDataModel = AppDataManager.shared.getSecondViewDataModel()
        let secondTabViewModel = SecondTabViewModel(model: secondViewDataModel)
        let secondTabVC = SecondTabViewController(viewModel: secondTabViewModel)
        secondTabVC.tabBarItem.image = UIImage(named: tabBarViewDataModel[1].tabBarName)

        let thirdViewDataModel = AppDataManager.shared.getThirdViewDataModel()
        let thirdViewModel = ThirdViewModel(model: thirdViewDataModel)
        let thirdVC = ThirdViewController(viewModel: thirdViewModel)
        thirdVC.tabBarItem.image = UIImage(named: tabBarViewDataModel[2].tabBarName)

        return (firstTabVC, secondTabVC, thirdVC)
    }

    static func makeTabBarAppearance(firstTabVC: FirstTabViewController, secondTabVC: SecondTabViewController, thirdVC: ThirdViewController) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstTabVC, secondTabVC, thirdVC]
        return tabBarController
    }
}
