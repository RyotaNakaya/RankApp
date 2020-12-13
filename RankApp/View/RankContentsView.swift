//
//  RankView.swift
//  RankApp
//
//  Created by 中屋亮太 on 2020/12/07.
//  Copyright © 2020 Ryota Nakaya. All rights reserved.
//

import SwiftUI

struct RankView: View {
    var body: some View {
        VStack {
            NavigationView {
                List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    NavigationLink(destination: /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) { /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Content@*/Text("Navigate")/*@END_MENU_TOKEN@*/ }
                }.navigationBarTitle("Rnaking")
            }
        }
    }
}

struct RankView_Previews: PreviewProvider {
    static var previews: some View {
        RankView()
    }
}
