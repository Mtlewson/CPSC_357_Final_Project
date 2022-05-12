// Chart view: Shows the pi chart and the expenditure data
// Pi chart and expenditure data made by Michael
// Buttons and transitions made by Liam
import SwiftUI

// Chart view: Shows the pi chart and the expenditure data
struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView().environmentObject(MonthData())
    }
}

struct ChartView : View {
    @EnvironmentObject var Monthdata: MonthData
    // Totals for each expenditure in each month
    
    // Used for when there's no expenditures
    var placeHolder = [Pie(id: 0, percent: CGFloat(100), name: "Food", color: Color("Color2"), total: 100)]
    // The chart data of expenditures
    func leftIsValid() -> Bool {
        return  Monthdata.index > 0
    }
    func rightIsValid() -> Bool {
        return Monthdata.index < Monthdata.months.count - 1
    }
    
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
            HStack{
                
                // left button
                Button {
                    if leftIsValid() {
                        Monthdata.index -= 1
                    }
                } label: {
                    Label("Back Month", systemImage: leftIsValid() ? "arrow.left.circle.fill" : "arrow.left.circle")
                        .labelStyle(.iconOnly)
                        .foregroundColor(leftIsValid() ? Color("Color2") : .gray)
                        .padding()
                        
                }

                Spacer()
                

                // right button

                Button {
                    if rightIsValid() {
                        Monthdata.index += 1
                    }
                } label: {
                    Label("Forward Month", systemImage: rightIsValid() ? "arrow.right.circle.fill" : "arrow.right.circle")
                        .labelStyle(.iconOnly)
                        .foregroundColor(rightIsValid() ? Color("Color2") : .gray)
                        .padding()
                }
        } //end of month switch button
            // Text on bottom half of screen including bar representative of size of each breakdown + color
            ZStack {
                Text("My Budget Breakdown")
                    .fontWeight(.bold)
            }
            .overlay(Rectangle().stroke(Color.black.opacity(0.05), lineWidth: 2))
            // makes chart
            if Monthdata.months[Monthdata.index].total > 0 { // If there are expenditures make the chart
                GeometryReader{g in
                    ZStack{
                        ForEach(0..<Monthdata.months[Monthdata.index].data.count){i in
                            DrawShape(data: Monthdata.months[Monthdata.index].data, center: CGPoint(x: g.frame(in: .global).width / 2,
                                                      y: g.frame(in: .global).height/2), index: i)
                        }
                        Circle()
                            .frame(width:150, height: 150)
                            .foregroundColor(Color.white)
                            .shadow(radius: 25)
                            .padding(.bottom, 16)
                        Text(String(format: "$ %.2f", Monthdata.months[Monthdata.index].total))
                            .font(.headline)
                            .padding(.bottom, 16)
                    }
                }
                .frame(height: 300)
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
                .frame(height: 300)
                .padding(.top, 20)
                .clipShape(Circle())
            .shadow(radius: 8)
            }
            
            // Prints out the information below the chart
            // Name, total cost, percentage of monthly expenses
            VStack {
                if Monthdata.months[Monthdata.index].total > 0 {
                    ForEach(Monthdata.months[Monthdata.index].data){i in
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
