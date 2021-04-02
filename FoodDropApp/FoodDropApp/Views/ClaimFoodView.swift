//
//  ClaimFoodView.swift
//  FoodDropApp
//
//  Created by Shahryar shagoshtasbi on 3/31/21.
//

import SwiftUI

var testFoods = [
    Food_post(id: "1", ownerId: "Mike", foodType: "Donut", pickupAddress: "123 F St", madeOnDate: "01/12/21", pickupDate: "01/13/21"),
    Food_post(id: "2", ownerId: "John", foodType: "Pizza", pickupAddress: "334 G St", madeOnDate: "01/13/21", pickupDate: "01/15/21")
]

struct ClaimFoodView: View {
    
    @ObservedObject private var claimFoodVM = ClaimFoodVM()
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                NavigationView{
                    List(claimFoodVM.foods) { food in
                        HStack {
                            NavigationLink(
                                destination: ClaimFoodSheetView(food: food),
                                label: {
                                    Text(food.foodType)
                                    Spacer()
                                    Text("Condition").foregroundColor(.gray)
                                })
                        }
                        
                    }
                }
                .navigationTitle("Food Drop")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear() {
                    self.claimFoodVM.fetchFoods()
                }
            }
            
        }
    }
}

struct ClaimFoodView_Previews: PreviewProvider {
    static var previews: some View {
        ClaimFoodView()
    }
}

struct ClaimFoodSheetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var food: Food_post
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
          
                VStack{
                    Text("Food Type: \(food.foodType)").padding()
                    Text("Pick up address: \(food.pickupAddress)").padding()
                    Text("Made on: \(food.madeOnDate)").padding()
                    Text("Pick up by: \(food.pickupDate)").padding()
                }
                Spacer()
                Button("Claim Food") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(10)
                .font(.system(size: 30, weight: .semibold))
                .padding()

            }
        }
    }
}
