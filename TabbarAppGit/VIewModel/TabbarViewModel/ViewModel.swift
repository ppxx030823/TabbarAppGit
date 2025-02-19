//
//  ViewModel.swift
//  TabbarAppGit
//
//  Created by ppx on 2025/2/17.
//

import UIKit
// ArticleCellViewModel，用于 ArticleTableViewCell 的视图模型
class ArticleCellViewModel {
    private let article: Article

    init(article: Article) {
        self.article = article
    }

    var avatarImage: UIImage? {
        return UIImage(named: article.avatarImage)
    }

    var sharedName: String {
        return article.sharedName
    }

    var actionType: String {
        return article.actionType
    }

    var articleCoverImage: UIImage? {
        return UIImage(named: article.articleCoverImage)
    }

    var articleTitle: String {
        return article.articleTitle
    }

    var articleSource: String {
        return article.articleSource
    }

    var articleTime: String {
        return article.articleTime
    }
}

// FirstTabViewModel，用于 FirstTabViewController 的视图模型
class FirstTabViewModel {
    var articles: [Article]

    init(articles: [Article]) {
        self.articles = articles
    }

    func numberOfRows() -> Int {
        return articles.count
    }

    func article(at index: Int) -> Article {
        return articles[index]
    }
}

// SecondTabViewModel，用于 SecondTabViewController 的视图模型
class SecondTabViewModel {
    private let model: SecondViewDataModel

    init(model: SecondViewDataModel) {
        self.model = model
    }

    var exploreImage: UIImage? {
        return UIImage(named: model.exploreImageName)
    }
}

// ThirdViewModel，用于 ThirdViewController 的视图模型
class ThirdViewModel {
    private let model: ThirdViewDataModel

    init(model: ThirdViewDataModel) {
        self.model = model
    }

    var profileImage: UIImage? {
        return UIImage(named: model.profileImageName)
    }
}

class TabBarNamesViewModel {
//    private let tabBarNameModel: TabBarNameModel
    var tabBarNames: [TabBarNameModel]
    init(tabBarNames: [TabBarNameModel]) {
        self.tabBarNames = tabBarNames
    }
    func tabBarNames(at index: Int) -> TabBarNameModel {
        return tabBarNames[index]
    }
}

class TabBarName {
    private let tabBarName: TabBarNameModel
    init(tabBarName: TabBarNameModel) {
        self.tabBarName = tabBarName
    }
    var tabBarViewNameImage: UIImage? {
        return UIImage(named: tabBarName.tabBarName)
    }
}
