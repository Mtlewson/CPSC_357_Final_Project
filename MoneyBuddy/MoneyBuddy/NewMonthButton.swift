//
//  NewMonthButton.swift
//  MoneyBuddy
//
//  Created by Liam Propst on 5/10/22.
//

import SwiftUI

struct NewMonthButton: View {
    
    @State var index: Int = 0
    var leftIsValid: Bool {
        get {
            return index > 0
        }
    }
    var rightIsValid: Bool {
        get {
            return index <= 4
        }
    }
    
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = "Red"
    
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .bold, scale: .large)
           
    var leftArrowFill: UIImage {
        return UIImage(systemName: "arrow.left.circle.fill", withConfiguration: largeConfig)!
    }
    
    var leftArrow: UIImage {
        return UIImage(systemName: "arrow.left.circle", withConfiguration: largeConfig)!
    }
    
    var rightArrowFill: UIImage {
        return UIImage(systemName: "arrow.right.circle.fill", withConfiguration: largeConfig)!
    }
    
    var rightArrow: UIImage {
        return UIImage(systemName: "arrow.right.circle", withConfiguration: largeConfig)!
    }

    
    
    var body: some View {
        VStack{
            Text(String(index))
                .font(.largeTitle)
            HStack{
                
                // left button
                Button {
                    if leftIsValid {
                        index -= 1
                    }
                } label: {
                    Label("Back Month", U leftIsValid ? leftArrowFill : leftArrow)
                        .labelStyle(.iconOnly)
                        .foregroundColor(leftIsValid ? Color("Color2") : .gray)
                        .padding()
                        
                }

                Spacer()
                

                // right button

                Button {
                    if rightIsValid {
                        index += 1
                    }
                } label: {
                    Label("Back Month", systemImage: rightIsValid ? "arrow.right.circle.fill" : "arrow.right.circle")
                        .labelStyle(.iconOnly)
                        .foregroundColor(rightIsValid ? Color("Color2") : .gray)
                        .padding()
                }
        }
            Picker("Please choose a color", selection: $selectedColor) {
                            ForEach(colors, id: \.self) {
                                Text($0)
                            }
                        }
                        Text("You selected: \(selectedColor)")
        }
        
        
        
        
    }
}

struct NewMonthButton_Previews: PreviewProvider {
    static var previews: some View {
        NewMonthButton()
    }
}
