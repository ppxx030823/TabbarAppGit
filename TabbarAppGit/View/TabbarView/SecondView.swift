//
//  SecondView.swift
//  TabbarAppGit
//
//  Created by ppx on 2025/2/17.
//

import UIKit
import SnapKit

class SecondTabViewController: UIViewController {
    private let viewModel: SecondTabViewModel
    private let dataModel = AppDataManager.shared.getSecondViewDataModel()
    private let exploreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = UIImage(named: )
        return imageView
    }()
    private let animationDuration: TimeInterval = 0.5
    private let animationDelay: TimeInterval = 0.1
    private let springDamping: CGFloat = 0.7
    private let initialSpringVelocity: CGFloat = 1

    init(viewModel: SecondTabViewModel) {
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
        exploreImageView.image = UIImage(named: dataModel.exploreImageName)
        
        view.addSubview(exploreImageView)
    }

    private func setupConstraints() {
        exploreImageView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.leading.equalTo(view.snp.leading)
        }
//        NSLayoutConstraint.activate([
//            exploreImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            exploreImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            exploreImageView.widthAnchor.constraint(equalToConstant: 200),
//            exploreImageView.heightAnchor.constraint(equalToConstant: 200)
//        ])
    }

    private func resetViewTransform() {
        exploreImageView.alpha = 0
        exploreImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }

    private func animateImageView() {
        UIView.animate(withDuration: animationDuration, delay: animationDelay, usingSpringWithDamping: springDamping, initialSpringVelocity: initialSpringVelocity, options: .curveEaseIn, animations: {
            self.exploreImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.exploreImageView.alpha = 1
        }, completion: nil)
    }
}
