//

//TitleScreen
// Creator: Michael
import SwiftUI

struct TitleScreenView: View {
    @Binding var titleScreenOn: Bool
    var body: some View {
        VStack{
            Text("Welcome To\n Money Buddy")
                .fontWeight(.semibold)
                .font(.largeTitle)
                .padding(.bottom, 20)
                .multilineTextAlignment(.center)
            HStack{
                Image("food")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Spacer()
                    .frame(width:90)
                Image("other")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }

            Button(action: TurnOffTitle){
                Text("View Expenditures")
                    .fontWeight(.semibold)
                    .font(.title)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color("ColorBlue"), Color("ColorGreen")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(200)

            }

            
            HStack{
                Image("utilities")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Spacer()
                    .frame(width:90)
                
                Image("personal")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
        }
    
    }
    func TurnOffTitle(){
        titleScreenOn = false
    }
}

struct TitleScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
