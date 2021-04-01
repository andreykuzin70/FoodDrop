//
//  ContentView.swift
//  FoodDropApp
//
//  Created by Andrey Kuzin on 3/16/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var goToCreateAccount: Bool = false
    @State var goToLogIn: Bool = true
    @State var goToPost: Bool = false
    @State var postSubmitted: Bool = false
    
    var body: some View {
        
        NavMenuView( goToCreateAccount: $goToCreateAccount, goToLogIn: $goToLogIn, goToPost: $goToPost, postSubmitted: $postSubmitted)
        
//        if goToCreateAccount {
//            CreateAccountView(goToCreateAccount: $goToCreateAccount, goToLogIn: $goToLogIn)
//        } else if goToLogIn {
//            SignInView(goToCreateAccount: $goToCreateAccount, goToLogIn: $goToLogIn, goToPost: $goToPost)
//        } else if goToPost {
//            PostFoodView(foodPosted: $postSubmitted, foodPost: $goToPost)
//        }else if postSubmitted{
//            PostConfirmationView()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
