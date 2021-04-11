//
//  AddRankContentMdal.swift
//  RankApp
//
//  Created by 中屋亮太 on 2021/04/03.
//  Copyright © 2021 Ryota Nakaya. All rights reserved.
//

import SwiftUI

struct AddRankContentModal: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    private var rankId = ""
    
    init(rankId: String) {
        self.rankId = rankId
    }
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("ランキングコンテンツ名", text: $name)
                .padding([.leading, .bottom, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack(spacing: 40) {
                Button(action: {
                    RankContent(name: self.name, rankId: rankId).save()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("add")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .frame(height: 32.0)
                        .padding(.horizontal, 16)
                        .background(Color.blue)
                        .cornerRadius(8.0)
                }

                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("cancel")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .frame(height: 32.0)
                        .padding(.horizontal, 16)
                        .background(Color.gray)
                        .cornerRadius(8.0)
                }
            }
        }
    }
}

struct AddRankContentModal_Previews: PreviewProvider {
    static var previews: some View {
        AddRankContentModal(rankId: "")
    }
}
