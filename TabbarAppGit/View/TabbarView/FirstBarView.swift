//
//  FirstBarView.swift
//  TabbarAppGit
//
//  Created by ppx on 2025/2/17.
//

// FirstTabViewController
import UIKit
import SnapKit

class FirstTabViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ArticleTableViewCellDelegate {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private let viewModel: FirstTabViewModel

    init(viewModel: FirstTabViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupBarButtonItem()
        setupTableView()
    }

    private func setupTitle() {
        // 设置视图控制器的标题
        title = "文章列表"
    }

    private func setupBarButtonItem() {
        // 创建一个 UIBarButtonItem
        let barButtonItem = UIBarButtonItem(title: "更多", style:.plain, target: self, action: #selector(moreButtonTapped))
        // 将 UIBarButtonItem 设置到导航栏的右侧
        navigationItem.rightBarButtonItem = barButtonItem
    }

    @objc private func moreButtonTapped() {
        // 处理按钮点击事件
        print("更多按钮被点击")
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "ArticleCell")

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("无法将单元格转换为 ArticleTableViewCell 类型")
        }
        let article = viewModel.article(at: indexPath.row)
        let cellViewModel = ArticleCellViewModel(article: article)
        cell.configure(with: cellViewModel)
        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }

    func didTapArticleTitleButton(in cell: ArticleTableViewCell) {
        let alertVC = CustomAlertViewController()
        alertVC.modalPresentationStyle = .overFullScreen
        present(alertVC, animated: true, completion: nil)
    }
}
