//
//  RankList.swift
//  RankApp
//
//  Created by 中屋亮太 on 2020/12/10.
//  Copyright © 2020 Ryota Nakaya. All rights reserved.
//

import Foundation
import Firebase

class Rank {

    let id: String
    let name: String
    let dispOrder: Int
    
    init(id: String) {
        self.id = id
        self.name = "rank_" + id
        self.dispOrder = 1
    }
    
    class func fetchAll() -> Array<Rank> {
        var ranks: [Rank] = []

//        とりあえず固定で返す
        for i in 1...20 {
            let rank = Rank(id: String(i))
            ranks.append(rank)
        }
        return ranks
    }
}
