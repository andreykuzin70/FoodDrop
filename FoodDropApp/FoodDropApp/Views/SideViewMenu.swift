//
//  SideViewMenu.swift
//  FoodDropApp
//
//  Created by Andrey Kuzin on 3/31/21.
//

import SwiftUI

struct SideViewMenu: View {
    @Binding var show: Bool
    
    @Binding var goToCreateAccount: Bool 
    @Binding var goToLogIn: Bool
    @Binding var goToPost: Bool
    @Binding var postSubmitted: Bool
    
//    func getDestination(option: SideMenuOptionModel) -> some View {
//        switch option {
//        case .CreatePost: return PostFoodView()
//        case .ClaimMeal: return ClaimFoodView()
//        case .LogOut: return CreateAccountView()
//        }
//    }
    
    
    var body: some View {
        ZStack{
            VStack{
                SideMenuHeaderView(home: $show)
                    .frame(height: 180)
                
                NavigationLink(
                    destination: PostFoodView(foodPosted: $postSubmitted, foodPost: $goToPost),
                    label: {
                        SideMenuOptionView(viewModel: SideMenuOptionModel.CreatePost)
                    })
                NavigationLink(
                    destination: ClaimFoodView(),
                    label: {
                        SideMenuOptionView(viewModel: SideMenuOptionModel.ClaimMeal)
                    })
                NavigationLink(
                    destination: SignInView(goToCreateAccount: $goToCreateAccount, goToLogIn: $goToLogIn, goToPost: $goToPost),
                    label: {
                        SideMenuOptionView(viewModel: SideMenuOptionModel.LogOut)
                    })
                Spacer()
            }
        }.navigationBarHidden(true)
    }
}

struct SideViewMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideViewMenu(show: .constant(true), goToCreateAccount: .constant(true), goToLogIn: .constant(true), goToPost: .constant(true), postSubmitted: .constant(true))
    }
}
