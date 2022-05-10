//
//  ModelData.swift
//  MoneyBuddy
//
//  Created by Liam Propst on 5/3/22.
//

import Foundation
import SwiftUI

struct Expenditure: Identifiable{
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
}


class MonthData: ObservableObject {
 @Published var months: [Month] = [Month(name: "January 2022",
                                         expenditures: [Expenditure(name: "Coffee", type: "food", desc: "coffe descrip", cost: 4.00)]),
                                   Month(name: "February 2022",
                                         expenditures: [Expenditure(name: "Bread", type: "groceries", desc: "bread descrip", cost: 124.00)])
                    ]
}


