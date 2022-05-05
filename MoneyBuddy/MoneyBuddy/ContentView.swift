//
//  ContentView.swift
//  MoneyBuddy
//
//  Created by Michael Lewson on 5/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MonthView().environmentObject(MonthData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

