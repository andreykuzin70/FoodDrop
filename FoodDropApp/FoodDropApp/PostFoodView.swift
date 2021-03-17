//
//  PostFoodView.swift
//  FoodDropApp
//
//  Created by Shahryar shagoshtasbi on 3/17/21.
//

import SwiftUI

struct PostFoodView: View {
    
    
    
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
                
                PostFoodFormView()
                
                Spacer()
            }
        }
    }
}


struct PostFoodView_Previews: PreviewProvider {
    static var previews: some View {
        PostFoodView()
    }
}

struct PostFoodFormView: View {
    @State var foodType: String = ""
    @State var pickUpAdd: String = ""
    @State var pickUpDate: Date = Date()
    
    var body: some View {
        VStack {
            
            TextField("Food Type", text: $foodType)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.horizontal)
            TextField("Pick Up Address", text: $pickUpAdd)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.horizontal)
            
            DatePicker("Made on ", selection: $pickUpDate)
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
            
            Spacer()
            
            Button(action: {}, label: {
                Text("Submit Food")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300)
                    .background(Color.red)
                    .cornerRadius(15.0)
                    .padding(.top)
            })
            
            Spacer()
            
        }
        
    }
    
}



