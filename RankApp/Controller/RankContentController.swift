//
//  RankContentsController.swift
//  RankApp
//
//  Created by 中屋亮太 on 2021/01/11.
//  Copyright © 2021 Ryota Nakaya. All rights reserved.
//

import Foundation

class RankContentController {
    class func fetchAllByRankId(rankId: Int) -> Array<RankContent> {
        return RankContent.fetchAllByRankId(rankId: rankId)
    }
}
