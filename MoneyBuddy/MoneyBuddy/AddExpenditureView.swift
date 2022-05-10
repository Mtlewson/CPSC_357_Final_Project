//
//  AddExpenditureView.swift
//  MoneyBuddy
//
//  Created by Liam Propst on 5/3/22.
//

import SwiftUI

struct AddExpenditureView: View {
    
    let expenditureTypes: [String] = ["food", "personal", "utilities", "other"]
    
    @EnvironmentObject var Monthdata : MonthData
    
    @State private var expenditureName: String = ""
    @State private var expenditureType: String = "food"
    @State private var expenditureDescription: String = ""
    @State private var expenditureCost: String = "0.0"
    
    var body: some View {
        Form {
            Section(header: Text("New Expenditure Details")) {
                DataStringInput(title: "Name", userInput: $expenditureName)
                
                VStack(alignment: HorizontalAlignment.leading) {
                    Text("Category")
                        .font(.headline)
                    Picker("", selection: $expenditureType){
                        ForEach(expenditureTypes, id: \.self){
                            Text($0)
                        } }.pickerStyle(SegmentedPickerStyle())
                }.padding()
                
                DataStringInput(title: "Description", userInput: $expenditureDescription)
                DataStringInput(title: "Cost", userInput: $expenditureCost)
            }
            
            Button(action: CreateNewExpenditure){
                Text("Add Expenditure")
            }
            Button(action: Shownew){
                Text("Show All")
            }
        }
    }
    func CreateNewExpenditure(){
        if let floatCost = Float(expenditureCost){
            let newExpenditure = Expenditure(
    //            id: UUID().uuidString,
                name: expenditureName,
                type: expenditureType,
                desc: expenditureDescription,
                cost: floatCost )
            Monthdata.months[0].expenditures.append(newExpenditure)
//            recipeStore.recipes.append(newRecipe)
            //TO DO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            // Add new expenditure to CURRENT month

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

struct AddExpenditureView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenditureView()
    }
}
