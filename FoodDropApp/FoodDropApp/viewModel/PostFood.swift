//
//  PostFood.swift
//  FoodDropApp
//
//  Created by Kibreab Gebrehiwot on 3/18/21.
//

import Foundation


public class PostFood: ObservableObject {
    
    static var id: Int = 0
    
    static func post_food(food_type: String, pickup_address: String,
                     madeOnDate: Date, pickup_date: Date) -> Bool{
        
        if !validate_post(food_type: food_type, pickup_address: pickup_address, madeOnDate: madeOnDate, pickup_date: pickup_date) {
            return false
        }
        
        let new_post = Food_post(food_type: food_type, pickup_address: pickup_address, madeOnDate: madeOnDate, pickup_date: pickup_date)
        
        Database.FoodPosts[id] = new_post
        
            id = id + 1
        
        return true

    }
    
    
    static func validate_post(food_type: String, pickup_address: String, madeOnDate: Date, pickup_date: Date) -> Bool{
        
        if(food_type == "" || pickup_address == "" || madeOnDate >= pickup_date){
            return false
        }
        
        
        return true
    }
}
