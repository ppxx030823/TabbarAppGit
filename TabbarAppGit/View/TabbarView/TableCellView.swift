//
//  TableCellView.swift
//  TabbarAppGit
//
//  Created by ppx on 2025/2/17.
//

import UIKit
import SnapKit

class ArticleTableViewCell: UITableViewCell {
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

    private let articleTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        contentView.addSubview(articleTitleLabel)
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

        articleTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(sharedNameLabel.snp.leading)
            make.top.equalTo(sharedNameLabel.snp.bottom).offset(4)
            make.trailing.equalTo(articleCoverImageView.snp.leading).offset(-8)
        }

        articleSourceLabel.snp.makeConstraints { make in
            make.leading.equalTo(articleTitleLabel.snp.leading)
            make.top.equalTo(articleTitleLabel.snp.bottom).offset(4)
        }

        articleCreatedAtLabel.snp.makeConstraints { make in
            make.leading.equalTo(articleSourceLabel.snp.trailing).offset(8)
            make.centerY.equalTo(articleSourceLabel.snp.centerY)
        }
//        NSLayoutConstraint.activate([
//            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
//            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
//            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
//
//            sharedNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
//            sharedNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
//
//            actionTypeLabel.leadingAnchor.constraint(equalTo: sharedNameLabel.trailingAnchor, constant: 8),
//            actionTypeLabel.centerYAnchor.constraint(equalTo: sharedNameLabel.centerYAnchor),
//
//            articleCoverImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            articleCoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
//            articleCoverImageView.widthAnchor.constraint(equalToConstant: 80),
//            articleCoverImageView.heightAnchor.constraint(equalToConstant: 80),
//
//            articleTitleLabel.leadingAnchor.constraint(equalTo: sharedNameLabel.leadingAnchor),
//            articleTitleLabel.topAnchor.constraint(equalTo: sharedNameLabel.bottomAnchor, constant: 4),
//            articleTitleLabel.trailingAnchor.constraint(equalTo: articleCoverImageView.leadingAnchor, constant: -8),
//
//            articleSourceLabel.leadingAnchor.constraint(equalTo: articleTitleLabel.leadingAnchor),
//            articleSourceLabel.topAnchor.constraint(equalTo: articleTitleLabel.bottomAnchor, constant: 4),
//
//            articleCreatedAtLabel.leadingAnchor.constraint(equalTo: articleSourceLabel.trailingAnchor, constant: 8),
//            articleCreatedAtLabel.centerYAnchor.constraint(equalTo: articleSourceLabel.centerYAnchor)
//        ])
    }

    func configure(with viewModel: ArticleCellViewModel) {
        avatarImageView.image = viewModel.avatarImage
        sharedNameLabel.text = viewModel.sharedName
        actionTypeLabel.text = viewModel.actionType
        articleCoverImageView.image = viewModel.articleCoverImage
        articleTitleLabel.text = viewModel.articleTitle
        articleSourceLabel.text = viewModel.articleSource
        articleCreatedAtLabel.text = viewModel.articleTime
    }
}
