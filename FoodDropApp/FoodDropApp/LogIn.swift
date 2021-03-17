//
//  LogIn.swift
//  FoodDropApp
//
//  Created by Kibreab Gebrehiwot on 3/17/21.
//

import Foundation


public class LogIn: ObservableObject{
    
    init() {
    }
    
    func validate_logIN(userName:String, password:String) -> Bool{
        
        if(userName == "" || password == ""){
            return false
        }
        
        if let user = Database.userDatabase[userName] {
            
            if password == user.password {
                return true
            }
            return false
        }
        
        return false
        
    }
}
