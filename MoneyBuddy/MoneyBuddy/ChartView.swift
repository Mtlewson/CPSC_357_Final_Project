import SwiftUI

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(month: MonthData().months[0])
    }
}

struct ChartView : View {
    var month: Month
    // Totals for each expenditure in each month
    var foodCalc: Float {
        var total: Float = 0.0
        for expen in month.expenditures{
            if expen.type == "food" {
                total += expen.cost
            }
        }
        return total
    }
    var personalCalc: Float {
        var total: Float = 0.0
        for expen in month.expenditures{
            if expen.type == "personal" {
                total += expen.cost
            }
        }
        return total
    }
    var utilCalc: Float {
        var total: Float = 0.0
        for expen in month.expenditures{
            if expen.type == "utilities" {
                total += expen.cost
            }
        }
        return total
    }
    var otherCalc: Float {
        var total: Float = 0.0
        for expen in month.expenditures{
            if expen.type == "other" {
                total += expen.cost
            }
        }
        return total
    }
    //
    var total: Float {
        var total: Float = 0.0
        for expen in month.expenditures{
            total += expen.cost

        }
        return total
    }
    // Used for when there's no expenditures
    var placeHolder = [Pie(id: 0, percent: CGFloat(100), name: "Food", color: Color("Color2"), total: 100)]
    // The chart data of expenditures
    var data: [Pie] {
        var temp: [Pie] = [
            Pie(id: 0, percent: CGFloat(foodCalc/total * 100), name: "Food", color: Color("Color2"), total: foodCalc),
                Pie(id: 1, percent: CGFloat(personalCalc/total * 100), name: "Personal", color: Color("Color5"), total: personalCalc),
                Pie(id: 2, percent: CGFloat(utilCalc/total * 100), name: "Utilities", color: Color("ColorBlue"), total: utilCalc),
                Pie(id: 3, percent: CGFloat(otherCalc/total * 100), name: "Other", color: Color("ColorPurple"), total: otherCalc)
            ]
        return temp
    }
    

    var body: some View {
        VStack{
            ZStack {
                Text("My Budget Breakdown")
                    .fontWeight(.bold)
            }
//            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
//            .padding()
            .overlay(Rectangle().stroke(Color.black.opacity(0.05), lineWidth: 2))
            
            if total > 0 { // If there are expenditures make the chart
                GeometryReader{g in
                    ZStack{
                        ForEach(0..<data.count){i in
                            DrawShape(data: data, center: CGPoint(x: g.frame(in: .global).width / 2,
                                                      y: g.frame(in: .global).height/2), index: i)
                        }
                        Circle()
                            .frame(width:150, height: 150)
                            .foregroundColor(Color.white)
                            .shadow(radius: 25)
//                            .shadow(radius: 50)
                        Text(String(format: "$ %.2f", total))
                            .font(.headline)
                    }
                }
                .frame(height: 360)
                .padding(.top, 20)
                .clipShape(Circle())
            .shadow(radius: 20)
            }
            else { // no expenditures, create a placeholder
                GeometryReader{g in
                    ZStack{
                        ForEach(0..<placeHolder.count){i in
                            DrawShape(data: placeHolder, center: CGPoint(x: g.frame(in: .global).width / 2,
                                                      y: g.frame(in: .global).height/2), index: i)
                        }
                    }
                }
                .frame(height: 360)
                .padding(.top, 20)
                .clipShape(Circle())
            .shadow(radius: 8)
            }
            
            // Prints out the information below the chart
            // Name, total cost, percentage of monthly expenses
            VStack {
                if total > 0 {
                    ForEach(data){i in
                        HStack{
                            
                            Text(i.name)
                                .frame(width: 100)
                            Text(("$ "+String(format: "%.2f", i.total)))
                            GeometryReader{g in
                                HStack{
                                    Spacer(minLength: 0)
                                    Text(String(format: "%.0f", i.percent)+" %")
                                        .fontWeight(.bold)
                                        .padding(.leading, 10)
                                   
                                    Rectangle()
                                        .fill(i.color)
                                        .frame(width: self.getWidth(width: g.frame(in: .global).width, value: i.percent/2), height: 10)
                                }
                            }
                        }
//                        .padding(.top, 18)
                    }
                }
                else {
                    Text("Please enter an expenditure")
                }
                
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.top)
        
    }
    // Returns width of pi chart
   func getWidth(width: CGFloat, value :  CGFloat)->CGFloat{
        let temp = value/100
        return temp * width
    }
}
// Creates pi chart
struct DrawShape : View {
    var data: [Pie]
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
