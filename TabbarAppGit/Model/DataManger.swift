//
//  DataManger.swift
//  TabbarAppGit
//
//  Created by ppx on 2025/2/17.
//

class AppDataManager {
    static let shared = AppDataManager()

    private init() {}

    func getArticles() -> [Article] {
        return [
            Article(
                avatarImage: "allen",
                sharedName: "Allen Wang",
                actionType: "Read Later",
                articleTitle: "Giphy Cam Lets You Create And Share Homemade Gifs",
                articleCoverImage: "giphy",
                articleSource: "TheNextWeb",
                articleTime: "5min  •  13:20"
            ),
            Article(
                avatarImage: "Daniel Hooper",
                sharedName: "Daniel Hooper",
                actionType: "Shared on Twitter",
                articleTitle: "Principle. The Sketch of Prototyping Tools",
                articleCoverImage: "my workflow flow",
                articleSource: "SketchTalk",
                articleTime: "3min  •  12:57"
            ),
            Article(
                avatarImage: "davidbeckham",
                sharedName: "David Beckham",
                actionType: "Shared on Facebook",
                articleTitle: "Ohlala, An Uber For Escorts, Launches Its ‘Paid Dating’ Service In NYC",
                articleCoverImage: "Ohlala",
                articleSource: "TechCrunch",
                articleTime: "1min  •  12:59"
            ),
            Article(
                avatarImage: "bruce",
                sharedName: "Bruce Fan",
                actionType: "Shared on Weibo",
                articleTitle: "Lonely Planet’s new mobile app helps you explore major cities like a pro",
                articleCoverImage: "Lonely Planet",
                articleSource: "36Kr",
                articleTime: "5min  •  11:21"
            )
        ]
    }

    func getSecondViewDataModel() -> SecondViewDataModel {
        return SecondViewDataModel(exploreImageName: "Explore")
    }

    func getThirdViewDataModel() -> ThirdViewDataModel {
        return ThirdViewDataModel(profileImageName: "Preview1")
    }

    func getTabBarViewDataModel() -> [TabBarNameModel] {
        return [
            TabBarNameModel(tabBarName: "tabbarHomeHighlighted"),
            TabBarNameModel(tabBarName: "tabbarExploreHighlighted"),
            TabBarNameModel(tabBarName: "tabbarProfileHighlighted")
            ]
    }
}
