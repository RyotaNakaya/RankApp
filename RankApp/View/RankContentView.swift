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
    @ObservedObject var items: RankContentList
    @State private var showingAddRankContentModal = false

    init(rankId: String) {
        self.rankId = rankId
        items = RankContentList(rankId: rankId)
    }
    
    var body: some View {
        VStack {
            List() {
                Section(header: Text("Rnaking_" + String(self.rankId))) {
                    ForEach(0 ..< items.rankContentList.count) { i in
                        Text(self.items.rankContentList[i].name)
                    }
                }
            }
            Spacer()
            Button(action: {
                self.showingAddRankContentModal.toggle()
            }) {
                Text("コンテンツ追加")
            }.sheet(isPresented: $showingAddRankContentModal){
                AddRankContentModal(rankId: rankId)
            }
        }
    }
}

struct RankContentView_Previews: PreviewProvider {
    static var previews: some View {
        RankContentView(rankId: "")
    }
}
