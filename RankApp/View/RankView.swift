//
//  RankListView.swift
//  RankApp
//
//  Created by 中屋亮太 on 2020/12/07.
//  Copyright © 2020 Ryota Nakaya. All rights reserved.
//

import SwiftUI

struct RankListView: View {
    let items = RankController.fetchAll()
    var body: some View {
        VStack {
            NavigationView {
                List() {
                    ForEach(0 ..< items.count) { i in
                        NavigationLink(destination: /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) { Text(self.items[i].name) }
                    }
                }.navigationBarTitle("RnakingList")
            }
        }
    }
}

struct RankListView_Previews: PreviewProvider {
    static var previews: some View {
        RankListView()
    }
}
