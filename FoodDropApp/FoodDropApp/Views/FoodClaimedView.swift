//
//  FoodClaimedView.swift
//  FoodDropApp
//
//  Created by Natnael Mekonnen on 4/15/21.
//

import SwiftUI

struct FoodClaimedView: View {
    @StateObject private var claimFoodVM = ClaimFoodVM()
    
    init() {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [
            .font : UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 50)),
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        
        appearance.backgroundColor = UIColor.init(Color.green)
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().tintColor = .blue
        
    }
    
    @State var showSheetView: Bool = false
    @State var selectedFoodIndex: Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                
                Text("Foods You Claimed")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 20)
                
                if claimFoodVM.claimedFoods.count != 0 {
                    List() {
                        ForEach (0..<claimFoodVM.claimedFoods.count, id: \.self) { i in
                            VStack {
                                HStack {
                                    Image("food-icon")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text(claimFoodVM.claimedFoods[i].foodType)
                                        .font(.title3).sheet(isPresented: $showSheetView, content: {
                                            FoodClaimedSheetView(food: claimFoodVM.claimedFoods[selectedFoodIndex], showSheetView: $showSheetView)
                                        })
                                }
                                RatingView(rating: claimFoodVM.foodRatings[i])
                            }
                            .onTapGesture {
                                selectedFoodIndex = i
                                showSheetView.toggle()
                            }
                        }.listRowBackground(Color.clear)
                    }
                    Spacer()
                } else {
                    Spacer()
                    Text("You have not claimed any food.")
                        .foregroundColor(.gray)
                        .padding()
                    Text("Please go ahead and claim a food!")
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()
                }
            }
            .onAppear() {
                self.claimFoodVM.getClaimedFoods()
            }
        }
    }
}

struct FoodClaimedView_Previews: PreviewProvider {
    static var previews: some View {
        FoodClaimedView()
    }
}

struct FoodClaimedSheetView: View {
    
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
                            .frame(width: 400, height: 300)
                            
                            Text("Made on: \(food.madeOnDate)")
                                .padding()
                                .font(.system(size: 15, weight: .semibold))
                            
                            Text("Pick up by: \(food.pickupDate)")
                                .padding()
                                .font(.system(size: 15, weight: .semibold))
                        }
                    }
                    Spacer()
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
