//
//  LoginOrSignView.swift
//  LoginAnimationGit
//
//  Created by ppx on 2025/2/17.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    private let viewModel = LoginViewModel()
    // 模拟登录成功的回调闭包
    var onLoginSuccess: (() -> Void)?

    static let buttonCornerRadius: CGFloat = 5
    private let animationDuration: TimeInterval = 0.5
    private let loginButtonAnimationDuration: TimeInterval = 1.0
    private let loginButtonSpringDamping: CGFloat = 0.2
    private let loginButtonInitialSpringVelocity: CGFloat = 10

    private let usernameTextField: UITextField = {
        let usernameTextField = UITextField()
        usernameTextField.placeholder = "Username"
        usernameTextField.layer.cornerRadius = LoginViewController.buttonCornerRadius
        usernameTextField.borderStyle = .roundedRect
        return usernameTextField
    }()

    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.layer.cornerRadius = LoginViewController.buttonCornerRadius
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()

    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = buttonCornerRadius
        return button
    }()

    private let showAlertButton: UIButton = {
        let showAlertButton = UIButton(type: .system)
        showAlertButton.setTitle("显示弹窗", for: .normal)
        showAlertButton.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        return showAlertButton
    }()

    private var usernameConstraint: NSLayoutConstraint!
    private var passwordConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupDelegates()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareForAnimation()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateUI()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(showAlertButton)
        addAction()
    }

    private func addAction() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        showAlertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }

    private func setupConstraints() {
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false

        usernameConstraint = usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        passwordConstraint = passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        usernameTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(100)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }

        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }

        loginButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(passwordTextField.snp.bottom).offset(50)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
    }

    private func setupDelegates() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }

    private func prepareForAnimation() {
        usernameConstraint.constant -= view.bounds.width
        passwordConstraint.constant -= view.bounds.width
        loginButton.alpha = 0
    }

    // MARK: 登陆动画
    private func animateInputFields() {
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseOut, animations: {
            self.usernameConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)

        UIView.animate(withDuration: animationDuration, delay: 0.1, options: .curveEaseOut, animations: {
            self.passwordConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    private func animateLoginButton() {
        UIView.animate(withDuration: animationDuration, delay: 0.2, options: .curveEaseOut, animations: {
            self.loginButton.alpha = 1
        }, completion: nil)
    }

    private func animateUI() {
        animateInputFields()
        animateLoginButton()
    }

    @objc private func loginButtonTapped() {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            return
        }
        let model = LoginModel(username: username, password: password)
        viewModel.validateLogin(with: model) { [weak self] isValid in
            if isValid {
                print("Login successful")
                let tabBarController = TabBarViewController.createTabBarController()
                self?.navigationController?.pushViewController(tabBarController, animated: true)
            } else {
                print("Login failed")
                // 显示登录成功弹窗

            }
        }

        // MARK: 页面跳转动画
        let bounds = self.loginButton.bounds
        UIView.animate(withDuration: loginButtonAnimationDuration, delay: 0.0, usingSpringWithDamping: loginButtonSpringDamping, initialSpringVelocity: loginButtonInitialSpringVelocity, options: .curveLinear, animations: {
            self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.loginButton.isEnabled = false
        }) { [weak self] finished in
            self?.loginButton.isEnabled = true
        }
        // 模拟登录成功
        onLoginSuccess?()

    }

    @objc private func showAlert() {
        let alertVC = CustomAlertViewController()
        alertVC.modalPresentationStyle = .overFullScreen
        present(alertVC, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
