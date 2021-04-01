//
//  SideViewMenu.swift
//  FoodDropApp
//
//  Created by Andrey Kuzin on 3/31/21.
//

import SwiftUI

struct SideViewMenu: View {
    @Binding var show: Bool
    
    
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
                
//                NavigationLink(
//                    destination: PostFoodView(),
//                    label: {
//                        SideMenuOptionView(viewModel: SideMenuOptionModel.CreatePost)
//                    })
                NavigationLink(
                    destination: ClaimFoodView(),
                    label: {
                        SideMenuOptionView(viewModel: SideMenuOptionModel.ClaimMeal)
                    })
//                NavigationLink(
//                    destination: SignInView(),
//                    label: {
//                        SideMenuOptionView(viewModel: SideMenuOptionModel.LogOut)
//                    })
                Spacer()
            }
        }.navigationBarHidden(true)
    }
}

struct SideViewMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideViewMenu(show: .constant(true))
    }
}
