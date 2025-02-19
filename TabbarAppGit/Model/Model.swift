//
//  Model.swift
//  TabbarAppGit
//
//  Created by ppx on 2025/2/17.
//

import UIKit

// Article 模型，用于存储文章相关信息
struct Article {
    let avatarImage: String
    let sharedName: String
    let actionType: String
    let articleTitle: String
    let articleCoverImage: String
    let articleSource: String
    let articleTime: String

    init(
        avatarImage: String,
        sharedName: String,
        actionType: String,
        articleTitle: String,
        articleCoverImage: String,
        articleSource: String,
        articleTime: String
    ) {
        self.avatarImage = avatarImage
        self.sharedName = sharedName
        self.actionType = actionType
        self.articleTitle = articleTitle
        self.articleCoverImage = articleCoverImage
        self.articleSource = articleSource
        self.articleTime = articleTime
    }

    static func Article() {
        
    }
}

// SecondViewDataModel，用于 SecondTabViewController 的数据模型
struct SecondViewDataModel {
    let exploreImageName: String

}

// ThirdViewDataModel，用于 ThirdViewController 的数据模型
struct ThirdViewDataModel {
    let profileImageName: String
}


struct TabBarNameModel {
    let tabBarName: String
    init(tabBarName: String) {
        self.tabBarName = tabBarName
    }
}



