//
//  PostFoodView.swift
//  FoodDropApp
//
//  Created by Shahryar shagoshtasbi on 3/17/21.
//

import SwiftUI

struct PostFoodView: View {
    @Binding var foodPosted: Bool
    @Binding var foodPost: Bool
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HeaderView()
                
                Spacer()
                
                Text("Post Food")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 20)
                
                PostFoodFormView(foodPosted: $foodPosted, foodPost: $foodPost)
                
                Spacer()
            }
        }
    }
}


//struct PostFoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostFoodView()
//    }
//}

struct PostFoodFormView: View {
    @Binding var foodPosted: Bool
    @Binding var foodPost: Bool
    
    @State var foodType: String = ""
    @State var pickUpAdd: String = ""
    @State var pickUpDate: Date = Date()
    @State var madeOnDate: Date = Date()
    @State var pickedFoodCondition = "Fresh"
    var foodCondition = ["Fresh","About to Expire","Expired"]
    
    @State var showAlert = false
    
    var body: some View {
        VStack {
            
            TextField("Food Type", text: $foodType)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.horizontal)
                .disableAutocorrection(true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            TextField("Pick Up Address", text: $pickUpAdd)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.horizontal)
                .disableAutocorrection(true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            
            DatePicker("Made on ", selection: $madeOnDate)
                .frame(height: 20)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.horizontal)
            
            
            DatePicker("Pickup By", selection: $pickUpDate, in: Date()...)
                .frame(height: 20)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.horizontal)
            
            
            Picker("Food Condition", selection: $pickedFoodCondition) {
                ForEach(foodCondition, id:\.self){
                    Text($0)
                }
            }.frame(height: 40)
            .padding()
            .padding(.top, 40)
//            .background(Color.white)
            .cornerRadius(5.0)
            .padding(.horizontal)
            
            
            
            Spacer()
            
            Button(action: {
                let postFoodVM = PostFoodVM()
                if postFoodVM.post_food(food_type: foodType, pickup_address: pickUpAdd, madeOnDate: madeOnDate, pickup_date: pickUpDate){
                    
                    foodPost = false
                    foodPosted = true
                    // successfully added
                    print("food successfully posted")
                }else{
                    showAlert = true
                }
            }, label: {
                Text("Submit Food")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300)
                    .background(Color.red)
                    .cornerRadius(15.0)
                    .padding(.top)
            }).alert(isPresented: $showAlert) {
                Alert(title: Text("Submission Failed"), message: Text(" Must fill the text fields "), dismissButton: .default(Text("OK")))
            }
            
            
            Spacer()
            
        }
        
    }
    
}



