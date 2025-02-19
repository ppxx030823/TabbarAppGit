//
//  APPFactory.swift
//  TabbarAppGit
//
//  Created by ppx on 2025/2/17.
//

import UIKit

// 视图控制器工厂类
class TabBarViewController: UITabBarController {
    static func createTabBarController() -> UITabBarController {
        let (firstTabVC, secondTabVC, thirdVC) = setupCells()
        return makeTabBarAppearance(firstTabVC: firstTabVC, secondTabVC: secondTabVC, thirdVC: thirdVC)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = nil
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
