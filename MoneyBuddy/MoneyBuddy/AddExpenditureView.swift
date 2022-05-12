//
//  AddExpenditureView.swift
//  MoneyBuddy
//
//  Created by Liam Propst on 5/3/22.
//

import SwiftUI

struct AddExpenditureView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let expenditureTypes: [String] = ["food", "personal", "utilities", "other"]
    
    @EnvironmentObject var Monthdata : MonthData
    
    
    @State private var expenditureName: String = ""
    @State private var expenditureType: String = "food"
    @State private var expenditureDescription: String = ""
    @State private var expenditureCost: String = ""
    
    var body: some View {
        VStack {
            
            Text("New Expenditure Details")
                .font(.largeTitle)
                .foregroundColor(Color("Color3"))
            
            TextField("Enter Name...", text: $expenditureName)
                
                .padding(20)
                .foregroundColor(Color.black)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .border(Color("Color3"), width: 3)
                .padding()
            
            VStack(alignment: HorizontalAlignment.leading) {
                Text("Category")
                    .font(.title2)
                    .foregroundColor(Color("Color3"))
                    
                Picker("", selection: $expenditureType){
                    ForEach(expenditureTypes, id: \.self){
                        Text($0)
                            .foregroundColor(Color("Color3"))
                    } }.pickerStyle(SegmentedPickerStyle())
                }.padding()
                
            Image(expenditureType)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding()
            
            TextField("Enter Desciption...", text: $expenditureDescription)
                
                .padding(20)
                .foregroundColor(Color.black)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .border(Color("Color3"), width: 3)
                .padding()
            
            TextField("Enter Cost in Dollars...", text: $expenditureCost)
                
                .padding(20)
                .foregroundColor(Color.black)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .border(Color("Color3"), width: 3)
                
                .padding()
//                DataStringInput(title: "Name", userInput: $expenditureName)
//
//                VStack(alignment: HorizontalAlignment.leading) {
//                    Text("Category")
//                        .font(.headline)
//                    Picker("", selection: $expenditureType){
//                        ForEach(expenditureTypes, id: \.self){
//                            Text($0)
//                        } }.pickerStyle(SegmentedPickerStyle())
//                }.padding()
//
//                DataStringInput(title: "Description", userInput: $expenditureDescription)
//                DataStringInput(title: "Cost", userInput: $expenditureCost)
            
            Button( action: {
                CreateNewExpenditure()
                
                
            },label: {
                Text("Add Expenditure")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Color3"), Color("Color2")]), startPoint: .top, endPoint: .bottom))
                    .foregroundColor(Color.white)
                    .clipShape(Capsule())
                    .padding()
            })
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true) // hides the "back" or previous view title button
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back to Chart") {
                    presentationMode.wrappedValue.dismiss()
                    // this changes in iOS15
                }
                .foregroundColor(Color("Color3"))
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
            Monthdata.months[Monthdata.index].expenditures.append(newExpenditure)
        expenditureType = "food"
        expenditureName = ""
        expenditureDescription = ""
        expenditureCost = "0.0"
//            recipeStore.recipes.append(newRecipe)
            //TO DO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            // Add new expenditure to CURRENT month

        }
        else{
            print("There was an error adding item")
        }// Else not add
//
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
