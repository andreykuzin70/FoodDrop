//
//  CreateAccount.swift
//  FoodDropApp
//
//  Created by Kibreab Gebrehiwot on 3/17/21.
//

import Foundation



public class CreateAccount: ObservableObject {
    

    static func create_Account(firstName: String, lastName: String, orgName: String,
                        email: String, phoneNum: String, address: String,
                        state: String, city: String, zipcode: String,
                        username: String, password: String)-> Bool {
        
        // validate and add user
        if validate_info(first_name: firstName, last_name: lastName, org_name: orgName, email: email, phone_num: phoneNum, address: address, state: state, city: city, zipcode: zipcode, userName: username, password: password) {
        
                let a = User_info(first_name: firstName, last_name: lastName, org_name: orgName,
                                   email: email, phone_num: phoneNum, address: address,
                                   state: state, city: city , zipcode: zipcode,
                                   userName: username, password: password);
        
                return Database.add_user(user:a)
        }
        
        // user is not added 
        return false
    }
    
    
    static func validate_info(first_name: String?, last_name: String?, org_name: String?,
                       email: String, phone_num: String, address: String,
                       state: String, city: String , zipcode: String,
                       userName: String, password: String) -> Bool{
        
        if first_name == "" || last_name == "" || email == "" || phone_num == "" ||
           address == "" || state == "" || city == "" || zipcode == "" || userName == "" ||
           password == ""{
            return false
        }
        
        return true
        
    }
}
