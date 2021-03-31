//
//  ClaimFoodView.swift
//  FoodDropApp
//
//  Created by Shahryar shagoshtasbi on 3/31/21.
//

import SwiftUI

struct ClaimFoodView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HeaderView()
                
                Spacer()
                List {
                    Text("food 1")
                    Text("food 1")
                    Text("food 1")
                    }
            }
        }
    }
}

struct ClaimFoodView_Previews: PreviewProvider {
    static var previews: some View {
        ClaimFoodView()
    }
}
