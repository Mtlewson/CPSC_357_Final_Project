//
//  wtf.swift
//  MoneyBuddy
//
//  Created by Liam Propst on 5/3/22.
//

import SwiftUI

struct FlavorView: View {
    let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip",
                 "Pistachio"]
    var body: some View {
        NavigationView {
            List(items, id: \.self) {
                Text($0)
            }
            .navigationBarTitle(Text("Today's Flavors"))
        }
    }
}

struct wtf_Previews: PreviewProvider {
    static var previews: some View {
        FlavorView()
    }
}
