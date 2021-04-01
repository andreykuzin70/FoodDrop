//
//  SideMenuHeaderView.swift
//  FoodDropApp
//
//  Created by Andrey Kuzin on 3/31/21.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var home: Bool
    
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
                Text("@User_Name")
                    .font(.system(size: 25, weight: .semibold))
                HStack{
                    Spacer()
                }
                Spacer()
            }.padding()
        }
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(home: .constant(true))
    }
}
