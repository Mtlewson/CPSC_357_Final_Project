//
//  ChartView.swift
//  MoneyBuddy
//
//  Created by Michael Lewson on 5/7/22.
//

import SwiftUI

struct ChartView: View {
    var body: some View {
        Home()
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

struct Home : View {
    var body: some View {
        VStack{
            ZStack {
                HStack{
                    Button(action: {
                        
                    }){
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .frame(width: 20, height: 15)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    
                    Button(action: {
                        
                    }){
                        Image(systemName: "bell.fill")
                            .foregroundColor(.black)
                    }
                } // end of hstack
                Text("My Budget Breakdown")
                    .fontWeight(.bold)
            }// end of zstack
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding()
            .overlay(Rectangle().stroke(Color.black.opacity(0.05), lineWidth: 2))
            GeometryReader{g in
                ZStack{
                    ForEach(0..<data.count){i in
                        DrawShape(center: CGPoint(x: g.frame(in: .global).width / 2,
                                                  y: g.frame(in: .global).height/2), index: i)
                    }
                }
            }
            .frame(height: 360)
            .padding(.top, 20)
            .clipShape(Circle())
            .shadow(radius: 8)
            
            VStack {
                ForEach(data){i in
                    HStack{
                        
                        Text(i.name)
                            .frame(width: 100)
                        GeometryReader{g in
                            HStack{
                                Spacer(minLength: 0)
                                Rectangle()
                                    .fill(i.color)
                                    .frame(width: self.getWidth(width: g.frame(in: .global).width, value: i.percent), height: 10)
                                Text(String(format: "\(i.percent)", "%.0f"))
                                    .fontWeight(.bold)
                                    .padding(.leading, 10)
                            }
                        }
                    }
                    .padding(.top, 18)
                }
            }
            .padding()
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        
    }
   func getWidth(width: CGFloat, value :  CGFloat)->CGFloat{
        let temp = value/100
        return temp * width
    }
}
// Creates pi chart
struct DrawShape : View {
    var center: CGPoint
    var index: Int
    var body: some View {
        
        Path{path in
            path.move(to: self.center)
            path.addArc(center: self.center, radius: 180, startAngle: .init(degrees: self.from()), endAngle:  .init(degrees: self.to()), clockwise: false)
        }
        .fill(data[index].color)
    }
    // since angle is continuous calculate the angles
    // Calculates angle origin
    func from() -> Double{
        var temp : Double = 0
        
        if index == 0{
            return 0
        }
        else {
            for i in 0...index-1{
                temp += Double(data[i].percent / 100) * 360
            }
            return temp
        }
    }
    
    // calculates angle end
    func to()->Double{
        var temp: Double = 0
        
        for i in 0...index {
            temp += Double(data[i].percent/100)*360
        }
        return temp
    }
    
    
}

// sample data
struct Pie : Identifiable {
    
    var id : Int
    var percent : CGFloat
    var name: String
    var color : Color
}

// Used to populate the chart / line metrics on bottom
var data = [
//    Pie(id : 0, percent 10, name: "name1", color: Color("Color1"))
    Pie(id: 0, percent: 20.0, name: "Food", color: Color.green),
    Pie(id: 1, percent: 20.0, name: "Travel", color: Color.blue),
    Pie(id: 2, percent: 30.0, name: "Fun", color: Color.yellow),
    Pie(id: 3, percent: 30.0, name: "Yeet", color: Color.red)
]

