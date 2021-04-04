//
//  RankContents.swift
//  RankApp
//
//  Created by 中屋亮太 on 2021/01/11.
//  Copyright © 2021 Ryota Nakaya. All rights reserved.
//

import Foundation
import Firebase

class RankContentList: ObservableObject {
    @Published var rankContentList: [RankContent]
    init(rankId: String) {
        self.rankContentList = []
        // fetchAllAsync 後にクロージャで rankContentList を更新する
        RankContent.fetchAllAsync(completion: { (res: [RankContent]) in
            self.rankContentList = res
        }, rankId: rankId)
    }
}

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
    
    class func fetchAllAsync(completion: @escaping ([RankContent])->(), rankId: String) {
        var contents: [RankContent] = []
        let db = Firestore.firestore()

        db.collection("rank_contents").whereField("rankId", isEqualTo: rankId).getDocuments { (snap, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let snap = snap {
                for document in snap.documents {
                    print("\(document.documentID) => \(document.data())")
                    contents.append(RankContent(id: document.documentID, name: document.data()["name"] as! String, rankId: document.data()["rankId"] as! String))
                }
            }

            // 引数のクロージャの実行
            completion(contents)
        }
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
