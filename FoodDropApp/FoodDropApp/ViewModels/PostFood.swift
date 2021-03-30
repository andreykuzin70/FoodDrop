//
//  PostFood.swift
//  FoodDropApp
//
//  Created by Kibreab Gebrehiwot on 3/18/21.
//

import Foundation


public class PostFood: ObservableObject {
    
    @Published var foodRepository = FoodRepository()
    
    func post_food(food_type: String, pickup_address: String,
                     madeOnDate: Date, pickup_date: Date) -> Bool{
        
        if !validate_post(food_type: food_type, pickup_address: pickup_address, madeOnDate: madeOnDate, pickup_date: pickup_date) {
            return false
        }
        
        let new_post = Food_post(foodType: food_type, pickupAddress: pickup_address, madeOnDate: madeOnDate, pickupDate: pickup_date)
        
//        Database.FoodPosts[id] = new_post
        
        self.foodRepository.addFood(new_post)
        
        return true

    }
    
    
    func validate_post(food_type: String, pickup_address: String, madeOnDate: Date, pickup_date: Date) -> Bool{
        
        if(food_type == "" || pickup_address == "" || madeOnDate >= pickup_date){
            return false
        }
        return true
    }
}
