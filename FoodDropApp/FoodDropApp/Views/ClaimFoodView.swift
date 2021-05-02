//
//  ClaimFoodView.swift
//  FoodDropApp
//
//  Created by Shahryar shagoshtasbi on 3/31/21.
//

import SwiftUI
import MapKit
import CoreLocation

struct ClaimFoodView: View {
    
    
    @StateObject private var claimFoodVM = ClaimFoodVM()
    @State var images: [String : UIImage] = [:]
    
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
    @State var image: UIImage?
    
    var body: some View {
//        ZStack {
            VStack {
            
                if claimFoodVM.foods.count != 0 {
                    HStack{
                        Spacer()
                        Button(action:{
                            claimFoodVM.sortFood()
                        }, label: {
                            Text("Filter by Date")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 400 , height: 50 )
                                .background(Color.blue)
                                .padding(.top, 5)
            
                        })
                    }.background(Color.clear)
                    
                    Spacer()
                    List() {
                        ForEach (0..<claimFoodVM.foods.count, id: \.self) { i in
                            VStack{
                                HStack {
                                    Text(claimFoodVM.foods[i].foodType)
                                        .font(.title3).sheet(isPresented: $showSheetView, content: {
                                            ClaimFoodSheetView(food: claimFoodVM.foods[selectedFoodIndex], showSheetView: $showSheetView)
                                        })
                                }
                                let id = claimFoodVM.foods[i].id
                                
                                Image(uiImage: claimFoodVM.foodImages[id!] ?? UIImage(imageLiteralResourceName: "food-icon"))
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 325, height: 325)
                            }
                            .onTapGesture {
                                selectedFoodIndex = i
                                showSheetView.toggle()
                            }
                        }.listRowBackground(Color.clear)
                    }
                    Spacer()
                } else {
                    Text("No available food to be claimed currently.")
                        .foregroundColor(.gray)
                        .padding()
                    Text("Come back next time!")
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            .onAppear() {
                self.claimFoodVM.fetchFoods()
            }
            
//        }
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
                    Button("Claim Food") {
                        let claimFoodVM = ClaimFoodVM()
                        if claimFoodVM.claimFood(food: food) {
                            showAlert = true
//                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
                    .font(.system(size: 30, weight: .semibold))
                    .padding()
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Food Claimed"), message: Text("Go to your claimed food to see it"), dismissButton: .default(Text("OK")) {
                                self.showSheetView = false
                            })
                    }
                    
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
