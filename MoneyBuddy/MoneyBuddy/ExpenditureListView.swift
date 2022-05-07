//
//  ExpenditureListView.swift
//  MoneyBuddy
//
//  Created by Eli Annoni on 5/7/22.
//

import SwiftUI

struct ExpenditureListView: View {
    let month: Month
    var body: some View {
        NavigationView {
            List {
                ForEach (month.expenditures) { expenditure in
                    ExpenditureView(expenditure: expenditure)
                }
            }
            .navigationBarTitle(Text(month.name))
        }
    }
}

struct ExpenditureListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenditureListView(month: Month(name: "January 2022", expenditures: [Expenditure(name: "Coffee", type: "food", desc: "coffe descrip", cost: 4.00), Expenditure(name: "Ralphs", type: "groceries", desc: "Eggs, Bread, Milk", cost: 35.00)]))
    }
}
