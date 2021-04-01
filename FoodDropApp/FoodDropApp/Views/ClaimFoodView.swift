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
//                HeaderView()
                NavigationView{
                    List {
                        HStack {
                            NavigationLink(
                                destination: ClaimFoodSheetView(),
                                label: {
                                    Text("Food Name")
                                    Spacer()
                                    Text("Condition").foregroundColor(.gray)
                                })
                        }
                        HStack{
                            Text("Food 2")
                        }
                        HStack{
                            Text("Food 3")
                        }
                        
                    }
                }
            }.navigationTitle("Food Drop")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ClaimFoodView_Previews: PreviewProvider {
    static var previews: some View {
        ClaimFoodView()
    }
}
