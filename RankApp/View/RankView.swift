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
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("追加")
            }
        }
    }
}

struct RankView_Previews: PreviewProvider {
    static var previews: some View {
        RankView()
    }
}
