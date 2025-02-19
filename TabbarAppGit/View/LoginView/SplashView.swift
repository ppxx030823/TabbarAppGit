//
//  LoginView.swift
//  LoginAnimationGit
//
//  Created by ppx on 2025/2/17.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
//    private let viewModel = SplashViewModel()
    static let buttonCornerRadius: CGFloat = 5

    private let signupButton: UIButton = {
        let signupButton = UIButton()
        signupButton.setTitle("Sign Up", for: .normal)
        signupButton.backgroundColor = .blue
        signupButton.layer.cornerRadius = buttonCornerRadius
        return signupButton
    }()

    private let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.layer.cornerRadius = buttonCornerRadius
        return loginButton
    }()

    private let logoImage: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.clipsToBounds = true
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "login-secondary-logo")
        logoImageView.tintColor = .black
        return logoImageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private func setupUI() {
        view.backgroundColor = .green
        view.addSubview(signupButton)
        view.addSubview(loginButton)
        view.addSubview(logoImage)
    }

    private func setupConstraints() {
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false

        logoImage.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(200)
        }

        signupButton.snp.makeConstraints { make in
            make.centerX.equalTo(logoImage.snp.centerX)
            make.top.equalTo(logoImage.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }

        loginButton.snp.makeConstraints { make in
            make.centerX.equalTo(logoImage.snp.centerX)
            make.top.equalTo(signupButton.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }

        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

    }

    @objc private func signupButtonTapped() {
        // 处理注册按钮点击事件，例如跳转到注册页面
        print("Sign Up button tapped")
    }

    @objc private func loginButtonTapped() {
        // 处理登录按钮点击事件，跳转到登录页面
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
}
