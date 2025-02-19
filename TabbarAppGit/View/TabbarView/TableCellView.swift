//
//  TableCellView.swift
//  TabbarAppGit
//
//  Created by ppx on 2025/2/17.
//

import UIKit
import SnapKit

class ArticleTableViewCell: UITableViewCell {
    weak var delegate: ArticleTableViewCellDelegate?


    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let sharedNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let actionTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let articleCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let articleTitleButton: UIButton = {
        let button = UIButton(type: .system)
        // 设置字体，和原来 UILabel 的字体保持一致
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        // 设置多行显示，虽然按钮一般不用设置这个，但这里为了保持逻辑类似
        button.titleLabel?.numberOfLines = 0

        // 禁用自动布局转换
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let articleSourceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let articleCreatedAtLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(sharedNameLabel)
        contentView.addSubview(actionTypeLabel)
        contentView.addSubview(articleCoverImageView)
        contentView.addSubview(articleTitleButton)
        contentView.addSubview(articleSourceLabel)
        contentView.addSubview(articleCreatedAtLabel)


        avatarImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.top.equalTo(contentView.snp.top).offset(16)
            make.width.height.equalTo(40)
        }

        sharedNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(8)
            make.top.equalTo(avatarImageView.snp.top)
        }

        actionTypeLabel.snp.makeConstraints { make in
            make.leading.equalTo(sharedNameLabel.snp.trailing).offset(8)
            make.centerY.equalTo(sharedNameLabel.snp.centerY)
        }

        articleCoverImageView.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.top.equalTo(contentView.snp.top).offset(16)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }

        articleTitleButton.snp.makeConstraints { make in
            make.leading.equalTo(sharedNameLabel.snp.leading)
            make.top.equalTo(sharedNameLabel.snp.bottom).offset(4)
            make.trailing.equalTo(articleCoverImageView.snp.leading).offset(-8)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }

        articleSourceLabel.snp.makeConstraints { make in
            make.leading.equalTo(articleTitleButton.snp.leading)
            make.top.equalTo(articleTitleButton.snp.bottom).offset(4)
        }

        articleCreatedAtLabel.snp.makeConstraints { make in
            make.leading.equalTo(articleSourceLabel.snp.trailing).offset(8)
            make.centerY.equalTo(articleSourceLabel.snp.centerY)
        }

        articleTitleButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }

    func configure(with viewModel: ArticleCellViewModel) {
        avatarImageView.image = viewModel.avatarImage
        sharedNameLabel.text = viewModel.sharedName
        actionTypeLabel.text = viewModel.actionType
        articleCoverImageView.image = viewModel.articleCoverImage
        articleTitleButton.setTitle(viewModel.articleTitle, for: .normal)
        articleSourceLabel.text = viewModel.articleSource
        articleCreatedAtLabel.text = viewModel.articleTime
    }

    @objc private func showAlert() {
        delegate?.didTapArticleTitleButton(in: self)
    }
}


protocol ArticleTableViewCellDelegate: AnyObject {
    func didTapArticleTitleButton(in cell: ArticleTableViewCell)
}
