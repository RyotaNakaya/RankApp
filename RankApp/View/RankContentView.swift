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
    var rankName:String = ""
    @ObservedObject var items: RankContentList
    @State private var showingAddRankContentModal = false

    init(rankId: String, rankName: String) {
        self.rankId = rankId
        self.rankName = rankName
        items = RankContentList(rankId: rankId)
    }
    
    var body: some View {
        VStack {
            List() {
                Section(header: Text(self.rankName)) {
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
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
                    .frame(height: 32.0)
                    .padding(.horizontal, 32)
                    .background(Color.blue)
                    .cornerRadius(8.0)
            }.padding(.bottom, 8.0)
            .sheet(isPresented: $showingAddRankContentModal){
                AddRankContentModal(rankId: rankId)
            }
        }
    }
}

struct RankContentView_Previews: PreviewProvider {
    static var previews: some View {
        RankContentView(rankId: "", rankName: "")
    }
}
