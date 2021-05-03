//
//  CreateAccount.swift
//  FoodDropApp
//
//  Created by Kibreab Gebrehiwot on 3/17/21.
//

import Foundation
import Firebase
import Combine


public class CreateAccountVM: ObservableObject {
    
    @Published var userRepository = UserRepository()
    
    // to user to the database
    func createAccountAddUser(firstName: String, lastName: String, orgName: String,
                        email: String, phoneNum: String, address: String,
                        state: String, city: String, zipcode: String,
                        password: String) {
        var userId: String?
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            userId = user?.uid
            if userId != nil {
                let newUser = User_info(userId: userId, firstName: firstName, lastName: lastName, orgName: orgName,
                                        email: email, phoneNum: phoneNum, address: address,
                                        state: state, city: city , zipcode: zipcode, password: password);
                print("added user")
                let _ = self.userRepository.addUser(newUser)
            }
        }
    }

    // to add it to the authentication
    func createAccount(email: String, password: String,
                       handler: @escaping AuthDataResultCallback){
        
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    // validate inputs
    func validate_info(first_name: String?, last_name: String?, org_name: String?,
                       email: String, phone_num: String, address: String,
                       state: String, city: String , zipcode: String,
                       password: String) -> Bool{
        
        if first_name == "" || last_name == "" || email == "" || phone_num == "" ||
           address == "" || state == "" || city == "" || zipcode == "" || password == ""{
            return false
        }
        
        return true
        
    }
   
}
