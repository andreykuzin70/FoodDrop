//
//  BackgroundView.swift
//  FoodDropApp
//
//  Created by Natnael Mekonnen on 3/17/21.
//
import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.green, Color("lightGreen")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}
