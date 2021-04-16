//
//  ClaimFoodView.swift
//  FoodDropApp
//
//  Created by Shahryar shagoshtasbi on 3/31/21.
//

import SwiftUI
import MapKit
import CoreLocation

//var testFoods = [
//    Food_post(id: "1", ownerId: "Mike", foodType: "Donut", pickupAddress: "123 F St", madeOnDate: "01/12/21", pickupDate: "01/13/21", isClaimed: false),
//    Food_post(id: "2", ownerId: "John", foodType: "Pizza", pickupAddress: "334 G St", madeOnDate: "01/13/21", pickupDate: "01/15/21", isClaimed: false)
//]

struct ClaimFoodView: View {
    
    
    @StateObject private var claimFoodVM = ClaimFoodVM()
    
    init() {
        // this is not the same as manipulating the proxy directly
        let appearance = UINavigationBarAppearance()
        
        // this overrides everything you have set up earlier.
        appearance.configureWithTransparentBackground()
        
        
        // this only applies to small titles
        appearance.titleTextAttributes = [
            .font : UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 50)),
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        
        appearance.backgroundColor = UIColor.init(Color.green)
        
        //In the following two lines you make sure that you apply the style for good
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        // This property is not present on the UINavigationBarAppearance
        // object for some reason and you have to leave it til the end
        UINavigationBar.appearance().tintColor = .blue
        
    }
    
    @State var showSheetView: Bool = false
    @State var selectedFoodIndex: Int = 0
    //@State var selected: Food_post = Food_post(id: "", ownerId: "", foodType: "", pickupAddress: "", madeOnDate: "", pickupDate: "", isClaimed: false, claimerId: "", latitude: "0", longitude: "0")
    
    var body: some View {
        ZStack {
            VStack {
                
                List() {
                    ForEach (0..<claimFoodVM.foods.count, id: \.self) { i in
                        //                    ForEach (testFoods) { food in
                        HStack {
                            Image("food-icon")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text(claimFoodVM.foods[i].foodType)
                                .onTapGesture {
                                    selectedFoodIndex = i
                                    showSheetView.toggle()
                                }.font(.title3).sheet(isPresented: $showSheetView, content: {
                                    ClaimFoodSheetView(food: claimFoodVM.foods[selectedFoodIndex], showSheetView: $showSheetView)
                                })
                        }
                    }.listRowBackground(Color.clear)
                }
                .onAppear() {
                    self.claimFoodVM.fetchFoods()
                }
                Spacer()
            }
            
        }
    }
}

struct ClaimFoodView_Previews: PreviewProvider {
    static var previews: some View {
        ClaimFoodView()
        //ClaimFoodSheetView(food: testFoods[0], showSheetView: .constant(true))
    }
}

struct ClaimFoodSheetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var food: Food_post
    
    @Binding var showSheetView: Bool
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    ZStack {
                        
                        VStack{
                            Text("Food Type: \(food.foodType)")
                                .padding()
                                .font(.system(size: 35, weight: .semibold))
                            
                            Text("Pick up address: \(food.pickupAddress)")
                                .padding()
                                .font(.system(size: 20, weight: .semibold))
                            
                            VStack {
                                MapView(newFood: food)
                            }
                            
                            
                            Text("Made on: \(food.madeOnDate)")
                                .padding()
                                .font(.system(size: 15, weight: .semibold))
                            
                            Text("Pick up by: \(food.pickupDate)")
                                .padding()
                                .font(.system(size: 15, weight: .semibold))
                        }
                    }
                    Spacer()
                    Button("Claim Food") {
                        let claimFoodVM = ClaimFoodVM()
                        if claimFoodVM.claimFood(food: food) {
                            showAlert = true
                            presentationMode.wrappedValue.dismiss()
                        }
                        showSheetView.toggle()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
                    .font(.system(size: 30, weight: .semibold))
                    .padding()
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Food Claimed"), message: Text("Go to your claimed food to see it"), dismissButton: .default(Text("OK")))
                    }
                    .disabled(!showSheetView)
                    
                }
            }
            .navigationBarTitle(Text("Food Details"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showSheetView = false
            }) {
                Text("Done").bold()
            })
        }
    }
}
