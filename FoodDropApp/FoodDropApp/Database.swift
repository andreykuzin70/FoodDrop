//
//  Database.swift
//  FoodDropApp
//
//  Created by Kibreab Gebrehiwot on 3/17/21.
//

import Foundation

public struct User_info{
    var first_name: String?
    var last_name: String?
    var org_name: String?
    var email: String
    var phone_num: String
    var address: String
    var state: String
    var city: String
    var zipcode: String
    var userName: String
    var password: String
}


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
    
    
    static func add_user(user:User_info)-> Bool{
        
        if let _ = userDatabase[user.userName] {
            
            // user name exist
            return false
        }
        
        userDatabase[user.userName] = user
        return true;
    }
}
