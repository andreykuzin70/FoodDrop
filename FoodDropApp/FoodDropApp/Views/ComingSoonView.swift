//
//  ComingSoonView.swift
//  FoodDropApp
//
//  Created by Natnael Mekonnen on 4/5/21.
//

import SwiftUI

struct ComingSoonView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "clock")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("This page is coming soon")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .bold()
                }
                Spacer()
            }
            
        }
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
    }
}
