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
    
    
    @StateObject private var claimFoodVM = ClaimFoodVM()
    
    init() {
        // this is not the same as manipulating the proxy directly
        let appearance = UINavigationBarAppearance()
        
        // this overrides everything you have set up earlier.
        appearance.configureWithTransparentBackground()
        

        // this only applies to small titles
        appearance.titleTextAttributes = [
            .font : UIFont.systemFont(ofSize: 25, weight: UIFont.Weight(rawValue: 150)),
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        
        appearance.backgroundColor = UIColor.init(Color.green)
        
        //In the following two lines you make sure that you apply the style for good
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        // This property is not present on the UINavigationBarAppearance
        // object for some reason and you have to leave it til the end
        UINavigationBar.appearance().tintColor = .blue
        
        // initialize any other instance variable
//        claimFoodVM = claimFoodVM
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                List(claimFoodVM.foods) { food in
//                List(testFoods) { food in
                    HStack {
                        NavigationLink(
                            destination: ClaimFoodSheetView(food: food),
                            label: {
                                Text(food.foodType)
                            })
                    }
                }
                .onAppear() {
                    self.claimFoodVM.fetchFoods()
                }
            }
            
        }
    }
}

struct ClaimFoodView_Previews: PreviewProvider {
    static var previews: some View {
//        ClaimFoodSheetView(food: testFoods[0])
        ClaimFoodView()
    }
}

struct ClaimFoodSheetView: View {
    
//    func dateFormatter(notFormattedDate: String) -> String? {
//        let df = DateFormatter()
//        print("The non formatted date is : \(notFormattedDate) ")
//        df.dateStyle = .short
//        df.timeStyle = .short
//        df.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
//
//
//        let a = df.date(from: notFormattedDate)
//        let b = df.string(from: a!)
//
//        return b
//    }
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var food: Food_post
    
    var body: some View {
 
        ZStack {
            BackgroundView()
            
            VStack {
                HeaderView()
                
                Spacer()
                ZStack{
                    Rectangle()
//                        .fill(LinearGradient(gradient: Gradient(colors: [.white, .white, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(minWidth: 100, idealWidth: 200, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 80, idealHeight: 150, maxHeight: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .mask(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.gray]), startPoint: .top, endPoint: .bottom))
                        .mask(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.gray]), startPoint: .bottom, endPoint: .top))
                     
                    VStack{
                        Text("Food Type: \(food.foodType)")
                            .padding()
                            .font(.system(size: 35, weight: .semibold))
                        
                        Text("Pick up address: \(food.pickupAddress)")
                            .padding()
                            .font(.system(size: 20, weight: .semibold))
                        
    //                    Text(dateFormatter(notFormattedDate:food.madeOnDate) ?? "No date" ).padding()
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

