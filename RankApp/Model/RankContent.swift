//
//  RankContents.swift
//  RankApp
//
//  Created by 中屋亮太 on 2021/01/11.
//  Copyright © 2021 Ryota Nakaya. All rights reserved.
//

import Foundation
import Firebase

class RankContent {

    let id: String
    var rankId: String
    let name: String
    let dispOrder: Int
    
    init(id: String = "", name: String, rankId: String) {
        self.id = id
        self.rankId = rankId
        self.name = name
        self.dispOrder = 1
    }
    
    class func fetchAllByRankId(rankId: String) -> Array<RankContent> {
        var contents: [RankContent] = []
//        とりあえず固定で返す
        for i in 1...5 {
            let content = RankContent(id: String(i), name: "name", rankId: rankId)
            contents.append(content)
        }
        return contents
    }
    
    func save() {
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        ref = db.collection("rank_contents").addDocument(data: [
            "name": self.name,
            "rankId": self.rankId
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }

    }
}
