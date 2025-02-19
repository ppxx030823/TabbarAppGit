//
//  MainViewController.swift
//  TabbarAppGit
//
//  Created by ppx on 2025/2/18.
//

import UIKit

class MainViewController {
    static func createNavigationController() -> UINavigationController {
        let splashVC = SplashViewController()
        let navigationVC = UINavigationController(rootViewController: splashVC)
        return  navigationVC
    }
}
