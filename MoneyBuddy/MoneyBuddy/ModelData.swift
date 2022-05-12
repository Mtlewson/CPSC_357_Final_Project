//
//  ModelData.swift
//  MoneyBuddy
//
//  Created by Liam Propst on 5/3/22.
//

import Foundation
import SwiftUI

struct Expenditure: Identifiable, Hashable{
    var id: Int
    var name: String
    var type: String
    var desc: String
    var cost: Float
    
    init(name: String, type: String, desc: String, cost: Float ){
        self.name = name
        self.type = type
        self.desc = desc
        self.cost = cost
        
        self.id = Int.random(in: 1...1000)
    }
}

struct Month{
    var name: String
    var expenditures: [Expenditure] = []
    
    var total: Float { get {
        var temp: Float = 0.0
        for expen in self.expenditures {
            temp += expen.cost
        }
        return temp
    }}
    
    var foodCalc: Float {
        var total: Float = 0.0
        for expen in self.expenditures{
            if expen.type == "food" {
                total += expen.cost
            }
        }
        return total
    }
    var personalCalc: Float {
        var total: Float = 0.0
        for expen in self.expenditures{
            if expen.type == "personal" {
                total += expen.cost
            }
        }
        return total
    }
    var utilCalc: Float {
        var total: Float = 0.0
        for expen in self.expenditures{
            if expen.type == "utilities" {
                total += expen.cost
            }
        }
        return total
    }
    var otherCalc: Float {
        var total: Float = 0.0
        for expen in self.expenditures{
            if expen.type == "other" {
                total += expen.cost
            }
        }
        return total
    }
    
    var data: [Pie] {
        var temp: [Pie] = [
            Pie(id: 0, percent: CGFloat(foodCalc/total * 100), name: "Food", color: Color("Color2"), total: foodCalc),
                Pie(id: 1, percent: CGFloat(personalCalc/total * 100), name: "Personal", color: Color("Color5"), total: personalCalc),
                Pie(id: 2, percent: CGFloat(utilCalc/total * 100), name: "Utilities", color: Color("ColorBlue"), total: utilCalc),
                Pie(id: 3, percent: CGFloat(otherCalc/total * 100), name: "Other", color: Color("ColorPurple"), total: otherCalc)
            ]
        return temp
    }
    
    
    
    init(name: String, expenditures: [Expenditure]){
        self.name = name
        self.expenditures = expenditures
    }
}


struct Pie : Identifiable {
    
    var id : Int
    var percent : CGFloat
    var name: String
    var color : Color
    var total : Float
}


class MonthData: ObservableObject {
 @Published var months: [Month] = [Month(name: "January 2022",
                                         expenditures: [Expenditure(name: "Coffee", type: "food", desc: "Starbucks", cost: 4.00),
                                                        Expenditure(name: "Breakfast", type: "food", desc: "iHop yum", cost: 4.50),
                                                        Expenditure(name: "Electric", type: "utilities", desc: "house utilities", cost: 20.00),
                                                        Expenditure(name: "Phone", type: "personal", desc: "phone bill", cost: 30.00),
                                                        Expenditure(name: "Movie Tickets", type: "other", desc: "movies", cost: 10.00),
                                                        Expenditure(name: "Tea", type: "food", desc: "green tea", cost: 1.00),
                                                        Expenditure(name: "Coffee", type: "food", desc: "Starbucks", cost: 4.00),
                                                        Expenditure(name: "Breakfast", type: "food", desc: "iHop yum", cost: 4.50),
                                                        Expenditure(name: "Electric", type: "utilities", desc: "house utilities", cost: 20.00),
                                                        Expenditure(name: "Phone", type: "personal", desc: "phone bill", cost: 30.00),
                                                        Expenditure(name: "Movie Tickets", type: "other", desc: "movies", cost: 10.00),
                                                        Expenditure(name: "Tea", type: "food", desc: "green tea", cost: 1.00)
                                                       
                                                       
                                                       
                                                       ]),
                                   Month(name: "February 2022",
                                         expenditures: [Expenditure(name: "Bread", type: "food", desc: "bread descrip", cost: 124.00)])
                    ]
   @Published var index: Int = 1
}


