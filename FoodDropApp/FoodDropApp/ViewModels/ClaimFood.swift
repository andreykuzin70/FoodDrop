//
//  ClaimFood.swift
//  FoodDropApp
//
//  Created by Shahryar shagoshtasbi on 3/31/21.
//

import Foundation


public class ClaimFood: ObservableObject {
 
    // This is the function that will return an array, including all the foodposts data from Database
    func get_food() -> [Food_post]?{
        return nil;
//            Database.FoodPosts[id] ?? Database.FoodPosts("Lasagna", "123 Rockville", Date.init(), Date.init(timeIntervalSinceNow: 3600))
    }
    
}
