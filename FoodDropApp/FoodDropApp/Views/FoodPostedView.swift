//
//  PostedFoodView.swift
//  FoodDropApp
//
//  Created by Shahryar shagoshtasbi on 4/15/21.
//


import SwiftUI

struct FoodPostedView: View {
    @StateObject private var postFoodVM = PostFoodVM()
    
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
                
                Text("Foods You Posted")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 20)
                
                List() {
                    ForEach (0..<postFoodVM.postedFoods.count, id: \.self) { i in
                        HStack {
                            Image("food-icon")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text(postFoodVM.postedFoods[i].foodType)
                                .onTapGesture {
                                    selectedFoodIndex = i
                                    showSheetView.toggle()
                                }.font(.title3).sheet(isPresented: $showSheetView, content: {
                                    PostedFoodSheetView(food: postFoodVM.postedFoods[selectedFoodIndex], showSheetView: $showSheetView)
                                })
                        }
                    }.listRowBackground(Color.clear)
                }
                .onAppear() {
                    self.postFoodVM.getPostedFoods()
                }
                Spacer()
            }
        }
    }
}

struct PostedFoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodPostedView()
    }
}

struct PostedFoodSheetView: View {
    
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
