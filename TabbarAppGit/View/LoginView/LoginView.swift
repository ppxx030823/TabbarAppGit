//
//  LoginOrSignView.swift
//  LoginAnimationGit
//
//  Created by ppx on 2025/2/17.
//

import UIKit

class LoginViewController: UIViewController {
    private let viewModel = LoginViewModel()

    private let buttonCornerRadius: CGFloat = 5
    private let animationDuration: TimeInterval = 0.5
    private let loginButtonAnimationDuration: TimeInterval = 1.0
    private let loginButtonSpringDamping: CGFloat = 0.2
    private let loginButtonInitialSpringVelocity: CGFloat = 10

    private let usernameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton(type: .system)

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

        usernameTextField.placeholder = "Username"
        usernameTextField.layer.cornerRadius = buttonCornerRadius
        usernameTextField.borderStyle = .roundedRect
        view.addSubview(usernameTextField)

        passwordTextField.placeholder = "Password"
        passwordTextField.layer.cornerRadius = buttonCornerRadius
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)

        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = buttonCornerRadius
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
    }

    private func setupConstraints() {
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false

        usernameConstraint = usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        passwordConstraint = passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        NSLayoutConstraint.activate([
            usernameConstraint,
            usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            usernameTextField.widthAnchor.constraint(equalToConstant: 250),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordConstraint,
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 250),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 250),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
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

    private func animateUI() {
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseOut, animations: {
            self.usernameConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)

        UIView.animate(withDuration: animationDuration, delay: 0.1, options: .curveEaseOut, animations: {
            self.passwordConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)

        UIView.animate(withDuration: animationDuration, delay: 0.2, options: .curveEaseOut, animations: {
            self.loginButton.alpha = 1
        }, completion: nil)
    }

    @objc private func loginButtonTapped() {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            return
        }
        let model = LoginModel(username: username, password: password)
        viewModel.validateLogin(with: model) { [weak self] isValid in
            if isValid {
                print("Login successful")
            } else {
                print("Login failed")
            }
        }

        let bounds = self.loginButton.bounds
        UIView.animate(withDuration: loginButtonAnimationDuration, delay: 0.0, usingSpringWithDamping: loginButtonSpringDamping, initialSpringVelocity: loginButtonInitialSpringVelocity, options: .curveLinear, animations: {
            self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.loginButton.isEnabled = false
        }) { [weak self] finished in
            self?.loginButton.isEnabled = true
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
