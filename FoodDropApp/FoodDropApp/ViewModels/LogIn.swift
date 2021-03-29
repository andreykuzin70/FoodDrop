//
//  LogIn.swift
//  FoodDropApp
//
//  Created by Kibreab Gebrehiwot on 3/17/21.
//

import Foundation


public class LogIn: ObservableObject{
    
    @Published var userRepository = UserRepository()
    init() {
        userRepository.$users.map { users in
            users.map { user in
                if !Database.add_user(user: user) {
                    print("Unable to add \(user.userName)")
                }
            }
        }
        print(Database.userDatabase)
    }
    
    func validate_logIN(userName:String, password:String) -> Bool{
    
        // for testing log in validation
        let temp = User_info(first_name: "Kib", last_name: "Geb", org_name: "Swift", email: "kgebrehi@umd.edu", phone_num: "123 456 7890", address: "1234 umd st.", state: "Md", city: "college park", zipcode: "12345", userName: "kibreab", password: "123456")
    
        Database.add_user(user: temp)
        
        if(userName == "" || password == ""){
            return false
        }
        
        if let user = Database.userDatabase[userName] {
            
            if password == user.password {
                return true
            }
            return false
        }
        print(Database.userDatabase)
        return false
        
    }
}
