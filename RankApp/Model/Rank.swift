//
//  RankList.swift
//  RankApp
//
//  Created by 中屋亮太 on 2020/12/10.
//  Copyright © 2020 Ryota Nakaya. All rights reserved.
//

import Foundation

class Rank {

    let id: Int
    let name: String
    let dispOrder: Int
    
    init(id: Int) {
        self.id = id
        self.name = "rank" + String(id)
        self.dispOrder = id
    }
    
    class func fetchAll() -> Array<Rank> {
        var ranks: [Rank] = []
//        とりあえず固定で返す
        for i in 1...10 {
            let rank = Rank(id: i)
            ranks.append(rank)
        }
        return ranks
    }
}
