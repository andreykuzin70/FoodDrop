//
//  FoodPost.swift
//  FoodDropApp
//
//  Created by Andrey Kuzin on 3/18/21.
//

import Foundation

class FoodPost:ObservableObject{
    @Published var madeOn: Date
    @Published var pickUp: Date
    @Published var typeOfFood: String
    @Published var address: String
    @Published var foodCondition: String
    
    init(madeOn: Date, pickUp: Date, typeOfFood: String, address: String, foodCondition: String) {
        self.madeOn = madeOn
        self.pickUp = pickUp
        self.typeOfFood = typeOfFood
        self.address = address
        self.foodCondition = foodCondition
    }
    
}
