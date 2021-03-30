//
//  LogIn.swift
//  FoodDropApp
//
//  Created by Kibreab Gebrehiwot on 3/17/21.
//

import Foundation
import FirebaseAuth

public class LogIn: ObservableObject{
    
    @Published var userRepository = UserRepository()
    
    func validate_logIN(email:String, password:String) -> Bool{
    
        // for testing log in validation
        let temp = User_info(firstName: "Kib", lastName: "Geb", orgName: "Swift", email: "kgebrehi@umd.edu", phoneNum: "123 456 7890", address: "1234 umd st.", state: "Md", city: "college park", zipcode: "12345", password: "123456")
    
        Auth.auth().signIn(withEmail: email, password: password) { (res, error) in
            if let error = error {
                fatalError(error.localizedDescription)
            } else {
                print("signed in")
            }
        }
        return true
        
    }
}
