//
//  RatingView.swift
//  FoodDropApp
//
//  Created by Shahryar shagoshtasbi on 4/28/21.
//

import SwiftUI

struct RatingView: View {
    
    @State var rating: Int
    @State var food: Food_post
    
    var label = ""
    
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    func image(for number: Int) -> Image {
        if number > food.rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    
    var body: some View {
        VStack{
            Text ("Please Rate Your Food Claiming Experience")
            HStack {
                if label.isEmpty == false {
                    Text(label)
                }
                
                ForEach(1..<maximumRating + 1) { number in
                    self.image(for: number)
                        .foregroundColor(number > self.food.rating ? self.offColor : self.onColor)
                        .onTapGesture {
                            self.food.rating = number
                            let _ = FoodRepository().updateFood(updatedFood: self.food)
                        }
                }
            }
        }
    }
}

