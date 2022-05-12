// Month view for each month ex: January 2022
// Shows pi chart and data metrics from ChartView
// Contributors: Liam
import SwiftUI

struct MonthView: View {
    @EnvironmentObject var Monthdata: MonthData

    var body: some View {
            NavigationView{
                VStack{
                    Spacer()
                    ChartView().environmentObject(Monthdata)
                    
                    Spacer()
                    
                    NavigationLink {
                        ExpenditureListView().environmentObject(Monthdata)
                    } label: {
                        HStack {
                            Image(systemName: "list.bullet.rectangle")
                                .resizable()
                                .scaledToFit()
                                .font(.title)
                                .frame(width: 20, height: 20)
                            Text("View Expenditures")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("ColorBlue"), Color("ColorGreen")]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .padding(.horizontal, 20)
                        // button to go to addExpenditureView
                    }.navigationBarTitle(Text(Monthdata.months[Monthdata.index].name))
                        .navigationBarItems(leading: NavigationLink(destination: AddExpenditureView().environmentObject(Monthdata)){
                        Text("Add Expenditure")
                            .foregroundColor(Color("Color3"))
                    })
            } // end of nav view
    }
}

struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView()
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
                        
// Struct for gradient
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
}
