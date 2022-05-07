//
//  ExpenditureView.swift
//  MoneyBuddy
//
//  Created by Eli Annoni on 5/7/22.
//

import SwiftUI

struct ExpenditureView: View {
    let expenditure: Expenditure
    var body: some View {
        HStack {
            Image(expenditure.type)
                .resizable()
                .frame(width: 60, height: 60)
                .padding()
            VStack(alignment: .leading) {
                Text(expenditure.name)
                    .font(.headline)
                    
                Text(expenditure.desc)
            }
            Spacer()
            Text(String(format: "-$%.2f", expenditure.cost))
                .foregroundColor(Color.red)
                .padding()
        }
    }
}

struct ExpenditureView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenditureView(expenditure: Expenditure(name: "Ralphs", type: "groceries", desc: "Eggs, Bread, Milk", cost: 35.00))
    }
}
