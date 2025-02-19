//
//  CustomAlertView.swift
//  TabbarAppGit
//
//  Created by ppx on 2025/2/18.
//

import UIKit
import SnapKit

// 自定义弹窗视图控制器
class CustomAlertViewController: UIViewController {
    private let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "这是一个自定义弹窗"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("关闭", for: .normal)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.1)

        setupAlertView()
        setupConstraints()
    }

    private func setupAlertView() {
        view.addSubview(alertView)
        alertView.addSubview(messageLabel)
        alertView.addSubview(closeButton)

        // 添加手势识别器以处理点击弹窗外区域退出弹窗
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOutsideAlert))
        view.addGestureRecognizer(tapGesture)
        closeButton.addTarget(self, action: #selector(closeAlert), for: .touchUpInside)
    }

    private func setupConstraints() {
        alertView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.width.equalTo(200)
            make.height.equalTo(150)
        }

        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(alertView.snp.top).offset(20)
            make.leading.equalTo(alertView.snp.leading).offset(20)
            make.trailing.equalTo(alertView.snp.trailing).offset(-20)
        }

        closeButton.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(20)
            make.centerX.equalTo(alertView.snp.centerX)
        }
    }

    // 提供方法让子类添加自定义视图到 alertView
    func addCustomView(_ customView: UIView) {
        alertView.addSubview(customView)
        customView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(alertView).inset(10)
            make.bottom.equalTo(closeButton.snp.top).offset(-10)
        }
    }

    @objc private func closeAlert() {
        dismiss(animated: true, completion: nil)
    }

    @objc private func handleTapOutsideAlert(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: view)
        if !alertView.frame.contains(location) {
            dismiss(animated: true, completion: nil)
        }
    }
}

// 主视图控制器
//class ViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let showAlertButton = UIButton(type: .system)
//        showAlertButton.setTitle("显示弹窗", for: .normal)
//        showAlertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
//        showAlertButton.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
//        view.addSubview(showAlertButton)
//    }
//
//    @objc private func showAlert() {
//        let alertVC = CustomAlertViewController()
//        alertVC.modalPresentationStyle = .overFullScreen
//        present(alertVC, animated: true, completion: nil)
//    }
//}
