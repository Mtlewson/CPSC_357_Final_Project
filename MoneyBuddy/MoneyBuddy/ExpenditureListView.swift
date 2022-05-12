// List view of all expenditures of each month
// Created by Eli and Liam
import SwiftUI

struct ExpenditureListView: View {
    @EnvironmentObject var Monthdata: MonthData
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Text("Expenditures in \(Monthdata.months[Monthdata.index].name)")
                .font(.title2)
                .foregroundColor(Color("Color3"))
            ScrollViewReader { scrollView in
                        ScrollView(.vertical) {
                            LazyVStack {
                                ForEach(Monthdata.months[Monthdata.index].expenditures) { expenditure in
                                    ExpenditureView(expenditure: expenditure)
                                }
                            }
                            .onAppear {
                                scrollView.scrollTo(Monthdata.months[Monthdata.index].expenditures[Monthdata.months[Monthdata.index].expenditures.endIndex - 1])
                            }
                        }
            }
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
}

struct ExpenditureListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenditureListView().environmentObject(MonthData())
    }
}
