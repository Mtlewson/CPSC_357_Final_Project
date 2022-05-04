//
//  MonthView.swift
//  MoneyBuddy
//
//  Created by Liam Propst on 5/3/22.
//

import SwiftUI

struct MonthView: View {
//    @StateObject private var recipeStore : RecipeStore = RecipeStore(recipes : recipeData)
//    @StateObject var recipeStore : RecipeStore
    var month: Month
    
    var body: some View {
        VStack{
            
            NavigationView{
                VStack{
                    
                    Spacer()
                    Image(systemName: "house.fill") //this will be a chart
                    
                    Spacer()
                    
                    Text("This is a button to add expenditure")
                    
                    // we want a button that goes to add expoeniture page
                        
                    

                    
                }.navigationBarTitle(month.name)
                    .navigationBarItems(leading: NavigationLink(destination: NewExpenseView()){
                        
                        //expenditureList : month.Expenditures)
                        
                        //NavigationLink(destination: AddNewRecipe(recipeStore: self.recipeStore))
                        Text("Add")
                            .foregroundColor(.blue)
                            .foregroundColor(.red)
                    }, trailing: EditButton())
                
            } // end of nav view
            
        }
    }
}

struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView(month: MonthData().months[0])
    }
}
                        
struct AddButton: View {
    var body: some View {
        
        HStack {
            Image(systemName: "plus")
                .font(.title)
            Text("Add City")
                .fontWeight(.semibold)
                .font(.title)
        }
        .padding()
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(40)
        .padding(.horizontal, 20)
        
    }
}
                        
                        
struct GradientBackgroundStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
