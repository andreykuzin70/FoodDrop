//
//  HeaderView.swift
//  FoodDropApp
//
//  Created by Natnael Mekonnen on 3/17/21.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("BreadN'Butter")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Image("food-icon")
                .renderingMode(.original)
                .resizable()
                .frame(width: 60, height: 60)
        }
    }
}
