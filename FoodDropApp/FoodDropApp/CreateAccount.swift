//
//  CreateAccount.swift
//  FoodDropApp
//
//  Created by Kibreab Gebrehiwot on 3/17/21.
//

import Foundation



public class CreateAccount: ObservableObject {
    

    func create_Account(fistName: String, lastName: String, orgName: String,
                        email: String, phoneNum: String, address: String,
                        state: String, city: String, zipcode: String,
                        username: String, password: String)-> Bool {
        
        
         // add user to the data bass
        
       let a = User(first_name: fistName, last_name: lastName, org_name: orgName,
                         email: email, phone_num: phoneNum, address: address,
                         state: state, city: city , zipcode: zipcode,
                         username: username, password: password);
        
        return Database.add_user(user:a)
        
        
    }
}
