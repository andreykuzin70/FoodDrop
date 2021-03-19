//
//  PostConfirmationView.swift
//  FoodDropApp
//
//  Created by Andrey Kuzin on 3/19/21.
//

import SwiftUI

struct PostConfirmationView: View {
    var body: some View {
        ZStack{
            BackgroundView()
            VStack{
                HeaderView()
                Text("Food Posting Successful!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct PostConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        PostConfirmationView()
    }
}
