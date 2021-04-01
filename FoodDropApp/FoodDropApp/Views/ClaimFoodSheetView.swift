//
//  ClaimFoodSheetView.swift
//  FoodDropApp
//
//  Created by Shahryar shagoshtasbi on 3/31/21.
//

import SwiftUI

struct ClaimFoodSheetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
          
                VStack{
                    Text("Food Name").padding()
                    Text("Food Condition").padding()
                    Text("Made On: 03/31/2021 - 12:45 AM").padding()
                    Text("Pick up by : 04/03/2021 - 11:45 PM").padding()
                }
                Spacer()
                Button("Claim Food") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(10)
                .font(.system(size: 30, weight: .semibold))
                .padding()

            }
        }
    }
}

struct ClaimFoodSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ClaimFoodSheetView()
    }
}
