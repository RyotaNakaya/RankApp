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
    @State private var isDisplayAddRankButton = true

    var body: some View {
        VStack {
            NavigationView {
                List() {
                    ForEach(0 ..< items.rankList.count, id: \.self) { i in
                        let item = self.items.rankList[i]
                        NavigationLink(destination: RankContentView(rankId: item.id, rankName: item.name)
                                        .onAppear(perform: {self.isDisplayAddRankButton = false})
                                        .onDisappear(perform: {self.isDisplayAddRankButton = true})
                        ){
                            Text(item.name)
                        }
                    }
                }.navigationBarTitle("RnakingList")
            }
            Spacer()
            if isDisplayAddRankButton {
                Button(action: {
                    self.showingAddRankModal.toggle()
                }) {
                    Text("ランキング追加")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .frame(height: 32.0)
                        .padding(.horizontal, 32)
                        .background(Color.blue)
                        .cornerRadius(8.0)
                }.padding(.bottom, 8.0)
                .sheet(isPresented: $showingAddRankModal){
                    AddRankModal()
                }
            }
        }
    }
}

struct RankView_Previews: PreviewProvider {
    static var previews: some View {
        RankView()
    }
}
