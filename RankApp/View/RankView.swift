//
//  RankView.swift
//  RankApp
//
//  Created by 中屋亮太 on 2020/12/07.
//  Copyright © 2020 Ryota Nakaya. All rights reserved.
//

import SwiftUI

struct RankView: View {
    let items = RankController.fetchAll()
    @State private var showingAddRankModal = false

    var body: some View {
        VStack {
            NavigationView {
                List() {
                    ForEach(0 ..< items.count) { i in
                        NavigationLink(destination: RankContentView(rankId: self.items[i].id)) { Text(self.items[i].name) }
                    }
                }.navigationBarTitle("RnakingList")
            }
            Spacer()
            Button(action: {
                self.showingAddRankModal.toggle()
            }) {
                Text("追加")
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
