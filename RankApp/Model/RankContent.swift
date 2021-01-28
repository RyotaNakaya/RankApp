//
//  RankContents.swift
//  RankApp
//
//  Created by 中屋亮太 on 2021/01/11.
//  Copyright © 2021 Ryota Nakaya. All rights reserved.
//

import Foundation

class RankContent {

    let id: String
    var rankId: String
    let name: String
    let dispOrder: Int
    
    init(id: String, rankId: String) {
        self.id = id
        self.rankId = rankId
        self.name = "rank_contents" + String(id)
        self.dispOrder = 1
    }
    
    class func fetchAllByRankId(rankId: String) -> Array<RankContent> {
        var contents: [RankContent] = []
//        とりあえず固定で返す
        for i in 1...5 {
            let content = RankContent(id: String(i), rankId: rankId)
            contents.append(content)
        }
        return contents
    }
}
