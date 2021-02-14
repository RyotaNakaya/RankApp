//
//  AddRankModal.swift
//  RankApp
//
//  Created by 中屋亮太 on 2021/01/24.
//  Copyright © 2021 Ryota Nakaya. All rights reserved.
//

import SwiftUI

struct AddRankModal: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("ランキング名", text: $name)
                .padding([.leading, .bottom, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack(spacing: 40) {
                Button(action: {
                    Rank(name: self.name).save()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("add")
                }

                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("cancel")
                }
            }
        }
    }
}

struct AddRankModal_Previews: PreviewProvider {
    static var previews: some View {
        AddRankModal()
    }
}
