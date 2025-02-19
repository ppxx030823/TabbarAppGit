//
//  ThirdView.swift
//  TabbarAppGit
//
//  Created by ppx on 2025/2/17.
//

import UIKit
import SnapKit

class ThirdViewController: UIViewController {
    private let viewModel: ThirdViewModel
    private let dataModel = AppDataManager.shared.getThirdViewDataModel()
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Explore")
        return imageView
    }()
    private let animationDuration: TimeInterval = 0.5
    private let animationDelay: TimeInterval = 0.1
    private let springDamping: CGFloat = 0.7
    private let initialSpringVelocity: CGFloat = 1

    init(viewModel: ThirdViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        resetViewTransform()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateImageView()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        resetViewTransform()
    }

    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        profileImageView.image = UIImage(named: dataModel.profileImageName)
        view.addSubview(profileImageView)
    }

    private func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

//        NSLayoutConstraint.activate([
//            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            profileImageView.widthAnchor.constraint(equalToConstant: 200),
//            profileImageView.heightAnchor.constraint(equalToConstant: 200)
//        ])
    }

    private func resetViewTransform() {
        profileImageView.alpha = 0
        profileImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }

    private func animateImageView() {
        UIView.animate(withDuration: animationDuration, delay: animationDelay, usingSpringWithDamping: springDamping, initialSpringVelocity: initialSpringVelocity, options: .curveEaseIn, animations: {
            self.profileImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.profileImageView.alpha = 1
        }, completion: nil)
    }
}
