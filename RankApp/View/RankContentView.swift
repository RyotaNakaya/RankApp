//
//  RankContentView.swift
//  RankApp
//
//  Created by 中屋亮太 on 2020/12/07.
//  Copyright © 2020 Ryota Nakaya. All rights reserved.
//

import SwiftUI

struct RankContentView: View {
    var rankId:String = ""
    var items: Array<RankContent>

    init(rankId: String) {
        self.rankId = rankId
        items = RankContentController.fetchAllByRankId(rankId: rankId)
    }
    
    var body: some View {
        VStack {
            List() {
                Section(header: Text("Rnaking_" + String(self.rankId))) {
                    ForEach(0 ..< items.count) { i in
                       Text(self.items[i].name)
                    }
                }
            }
        }
    }
}

struct RankContentView_Previews: PreviewProvider {
    static var previews: some View {
        RankContentView(rankId: "")
    }
}
