//
//  Database.swift
//  FoodDropApp
//
//  Created by Kibreab Gebrehiwot on 3/17/21.
//

import Foundation

public struct Food_post{
    var food_type: String
    var pickup_address: String
    var pickup_date: String
}

public class Database {
    
    static var userDatabase: [String: User_info] = [:]
    static var FoodPosts: [String: String] = [:]
    
    init() {
    }
    
    
    static func add_user(user:User)-> Bool{
        
        if let _ = userDatabase[user.userName] {
            // user name exist
            return false
        }
        
        userDatabase[user.userName] = user
        return true;
    }
}
