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
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.bottom, 20)
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

//struct CreateAccountFormView: View {
//    
//    
//  
//    
//    
//    
//    
//    
//}



