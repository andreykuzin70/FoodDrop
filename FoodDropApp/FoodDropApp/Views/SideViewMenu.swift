//
//  SideViewMenu.swift
//  FoodDropApp
//
//  Created by Andrey Kuzin on 3/31/21.
//

import SwiftUI
import Firebase

struct SideViewMenu: View {
    @Binding var show: Bool
    
    @Binding var goToCreateAccount: Bool
    @Binding var goToLogIn: Bool
    @Binding var goToNavMenu: Bool
    
    var body: some View {
        ZStack{
            VStack{
                SideMenuHeaderView(home: $show)
                    .frame(height: 180)
                
                NavigationLink(
                    destination: PostFoodView(),
                    label: {
                        SideMenuOptionView(viewModel: SideMenuOptionVM.CreatePost)
                    })
                NavigationLink(
                    destination: ClaimFoodView(),
                    label: {
                        SideMenuOptionView(viewModel: SideMenuOptionVM.ClaimMeal)
                    })
                NavigationLink(
                    destination: LogOutView(goToCreateAccount: $goToCreateAccount, goToLogIn: $goToLogIn, goToNavMenu: $goToNavMenu).environmentObject(LogInVM()),
                    label: {
                        SideMenuOptionView(viewModel: SideMenuOptionVM.LogOut)
                    })
                Spacer()
            }
        }.navigationBarHidden(true)
    }
}

struct SideViewMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideViewMenu(show: .constant(true), goToCreateAccount: .constant(true), goToLogIn: .constant(true), goToNavMenu: .constant(false))
    }
}

struct SideMenuHeaderView: View {
    @Binding var home: Bool
    var userRepository = UserRepository()
    //static var user:User?
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            Button(action: {
                withAnimation(.spring()){
                    home.toggle()}}
                , label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundColor(.black)
                    .padding()
            })
            
            
            VStack(alignment: .leading){
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .padding(.bottom, 16)
                
                Text(LogInVM.userName ?? "default")
                    .font(.system(size: 25, weight: .semibold)).onAppear()
                HStack{
                    Spacer()
                }
                Spacer()
            }.padding()
        }
    }
}

struct SideMenuOptionView: View {
    let viewModel: SideMenuOptionVM
    
    var body: some View {
        HStack{
            Image(systemName: viewModel.imageName)
                .frame(width: 40, height: 40)
                .font(.system(size: 25, weight: .semibold))
                .padding()
            Text(viewModel.title)
                .font(.system(size: 20, weight: .semibold))
            Spacer()
        }
        .padding()
        .frame(height: 45)
    }
}
