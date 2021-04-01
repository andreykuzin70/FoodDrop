//
//  NavMenuView.swift
//  FoodDropApp
//
//  Created by Andrey Kuzin on 3/31/21.
//

import SwiftUI

struct NavMenuView: View {
    @State private var isShowing = false
    
    var body: some View {
        
        NavigationView{
            ZStack{
                if isShowing{
                    SideViewMenu(show: $isShowing)
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
        NavMenuView()
    }
}
