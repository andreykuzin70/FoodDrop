//
//  SideMenuOptionView.swift
//  FoodDropApp
//
//  Created by Andrey Kuzin on 3/31/21.
//

import SwiftUI

struct SideMenuOptionView: View {
    let viewModel: SideMenuOptionModel
    
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

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(viewModel: .LogOut)
    }
}
