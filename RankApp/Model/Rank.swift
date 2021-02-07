//
//  RankList.swift
//  RankApp
//
//  Created by 中屋亮太 on 2020/12/10.
//  Copyright © 2020 Ryota Nakaya. All rights reserved.
//

import Foundation
import Firebase

class RankList: ObservableObject {
    @Published var rankList: [Rank]
    init() {
        self.rankList = []
        // fetchAll 後にクロージャで rankList を更新する
        _ = Rank.fetchAllAsync(completion: { (res: [Rank]) in
            self.rankList = res
        })
    }
}

class Rank: ObservableObject {

    let id: String
    let name: String
    let dispOrder: Int
    
    init(id: String) {
        self.id = id
        self.name = "rank_" + id
        self.dispOrder = 1
    }
    
    class func fetchAllAsync(completion: @escaping ([Rank])->()) {
        var ranks: [Rank] = []
        let db = Firestore.firestore()

        db.collection("ranks").getDocuments { (snap, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let snap = snap {
                for document in snap.documents {
                    print("\(document.documentID) => \(document.data())")
                    ranks.append(Rank(id: document.documentID))
                }
            }

            // 引数のクロージャの実行
            completion(ranks)
        }
    }
}
