//
//  ViewModel.swift
//  LoginAnimationGit
//
//  Created by ppx on 2025/2/17.
//

import Foundation

class LoginViewModel {
    // 模拟登录验证方法，实际开发中需要调用网络请求等进行验证
    func validateLogin(with model: LoginModel, completion: @escaping (Bool) -> Void) {
        // 简单示例，验证用户名和密码是否为 "admin" 和 "123456"
        let isValid = model.username == "admin" && model.password == "123456"
        completion(isValid)
    }
}
