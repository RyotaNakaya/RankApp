//
//  RankContents.swift
//  RankApp
//
//  Created by 中屋亮太 on 2021/01/11.
//  Copyright © 2021 Ryota Nakaya. All rights reserved.
//

import Foundation

class RankContent {

    let id: Int
    var rankId: Int
    let name: String
    let dispOrder: Int
    
    init(id: Int, rankId: Int) {
        self.id = id
        self.rankId = rankId
        self.name = "rank_contents" + String(id)
        self.dispOrder = id
    }
    
    class func fetchAllByRankId(rankId: Int) -> Array<RankContent> {
        var contents: [RankContent] = []
//        とりあえず固定で返す
        for i in 1...5 {
            let content = RankContent(id: i, rankId: rankId)
            contents.append(content)
        }
        return contents
    }
}
