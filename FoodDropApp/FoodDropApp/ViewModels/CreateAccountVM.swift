//
//  CreateAccount.swift
//  FoodDropApp
//
//  Created by Kibreab Gebrehiwot on 3/17/21.
//

import Foundation
import Firebase


public class CreateAccountVM: ObservableObject {
    
    @Published var userRepository = UserRepository()
    
    func create_Account(firstName: String, lastName: String, orgName: String,
                        email: String, phoneNum: String, address: String,
                        state: String, city: String, zipcode: String,
                        password: String)-> Bool {
        // validate and add user
        if validate_info(first_name: firstName, last_name: lastName, org_name: orgName, email: email, phone_num: phoneNum, address: address, state: state, city: city, zipcode: zipcode, password: password) {
            var userId: String?
            
            Auth.auth().createUser(withEmail: email, password: password) { (res, error) in
                if let error = error {
                    fatalError(error.localizedDescription)
                } else {
//                    userId = Auth.auth().currentUser?.uid
                    print("signed up")
                }
            }
            Auth.auth().addStateDidChangeListener { (auth, user) in
                userId = user?.uid
                let newUser = User_info(userId: userId, firstName: firstName, lastName: lastName, orgName: orgName,
                                        email: email, phoneNum: phoneNum, address: address,
                                        state: state, city: city , zipcode: zipcode, password: password);
                print("added user")
                self.userRepository.addUser(newUser)
            }
            return true
        }
        
        // user is not added 
        return false
    }
    
    
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
