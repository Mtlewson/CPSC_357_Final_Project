//
//  NewExpenseView.swift
//  MoneyBuddy
//
//  Created by Liam Propst on 5/3/22.
//

import SwiftUI

struct NewExpenseView: View {
    
    @EnvironmentObject var Monthdata : MonthData
    
    @State private var expenseName: String = ""
    @State private var expenseType: String = ""
    @State private var expenseDescription: String = ""
    @State private var expenseCost: String = "0.0"
    
    var body: some View {
        Form {
            Section(header: Text("New Expense Details")) {
                DataStringInput(title: "Name", userInput: $expenseName)
                DataStringInput(title: "Type", userInput: $expenseType)
                DataStringInput(title: "Description", userInput: $expenseDescription)
                DataStringInput(title: "Cost", userInput: $expenseCost)
            }
            
            Button(action: CreateNewExpense){
                Text("Add Expense")
            }
            Button(action: Shownew){
                Text("Show All")
            }
        }
    }
    func CreateNewExpense(){
        if let floatCost = Float(expenseCost){
            let newExpense = Expenditure(
    //            id: UUID().uuidString,
                name: expenseName,
                type: expenseType,
                desc: expenseDescription,
                cost: floatCost )
            Monthdata.months[0].expenditures.append(newExpense)
//            recipeStore.recipes.append(newRecipe)
            //TO DO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            // Add new expense to CURRENT month

        } // Else not add
//
    }
    
    func Shownew(){
        for number in 0..<Monthdata.months[0].expenditures.count{
            print(Monthdata.months[0].expenditures[number].name)
        }
    }
}


// Structure for adding the data
struct DataStringInput: View {
    var title: String
    @Binding var userInput: String
        
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
        }
}

// Structure for adding the data
//struct DataFloatInput: View {
//    var title: Float
//    @Binding var userInput: Float
//
//    var body: some View {
//        VStack(alignment: HorizontalAlignment.leading) {
//            Text(title)
//                .font(.headline)
//            TextField("Enter \(title)", text: $userInput).textFieldStyle(RoundedBorderTextFieldStyle())
//            }
//            .padding()
//        }
//}

struct NewExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        NewExpenseView()
    }
}
