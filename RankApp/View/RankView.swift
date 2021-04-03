//
//  RankView.swift
//  RankApp
//
//  Created by 中屋亮太 on 2020/12/07.
//  Copyright © 2020 Ryota Nakaya. All rights reserved.
//

import SwiftUI

struct RankView: View {
    @ObservedObject var items = RankList()
    @State private var showingAddRankModal = false

    var body: some View {
        VStack {
            NavigationView {
                List() {
                    ForEach(0 ..< items.rankList.count, id: \.self) { i in
                        NavigationLink(destination: RankContentView(rankId: self.items.rankList[i].id)) { Text(self.items.rankList[i].name) }
                    }
                }.navigationBarTitle("RnakingList")
            }
            Spacer()
            Button(action: {
                self.showingAddRankModal.toggle()
            }) {
                Text("ランキング追加")
            }.sheet(isPresented: $showingAddRankModal){
                AddRankModal()
            }
        }
    }
}

struct RankView_Previews: PreviewProvider {
    static var previews: some View {
        RankView()
    }
}
