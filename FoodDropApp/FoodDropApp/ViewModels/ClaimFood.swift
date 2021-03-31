//
//  ClaimFood.swift
//  FoodDropApp
//
//  Created by Shahryar shagoshtasbi on 3/31/21.
//

import Foundation


public class ClaimFood: ObservableObject {
 
    // This is the function that will return the all of the foods listed in the database
    func get_food() -> [Food_post]?{
        return nil;
//            Database.FoodPosts[id] ?? Database.FoodPosts("Lasagna", "123 Rockville", Date.init(), Date.init(timeIntervalSinceNow: 3600))
    }
    
}
