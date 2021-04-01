//
//  NavMenuView.swift
//  FoodDropApp
//
//  Created by Andrey Kuzin on 3/31/21.
//

import SwiftUI

struct NavMenuView: View {
    @State private var isShowing = false
    
    
    @Binding var goToCreateAccount: Bool
    @Binding var goToLogIn: Bool
    @Binding var goToPost: Bool
    @Binding var postSubmitted: Bool
    
    
    var body: some View {
        
        NavigationView{
            ZStack{
                if isShowing{
                    SideViewMenu(show: $isShowing, goToCreateAccount: $goToCreateAccount, goToLogIn: $goToLogIn, goToPost: $goToPost, postSubmitted: $postSubmitted)
                }
                BackgroundView()
                    
                    .offset(x: isShowing ? 300 : 0, y: isShowing ? 100 : 0)
                    .navigationBarItems(leading: Button(action: {
                        withAnimation(.spring()){
                            isShowing.toggle()
                        }
                    }, label: {Image(systemName: "list.bullet").foregroundColor(.black)}))
                    .navigationTitle("Home")
                
            }
        }
    }
}

struct NavMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavMenuView(goToCreateAccount: .constant(true), goToLogIn: .constant(true), goToPost: .constant(true), postSubmitted: .constant(true))
    }
}
