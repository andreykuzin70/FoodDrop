//
//  user.swift
//  FoodDropApp
//
//  Created by Andrey Kuzin on 3/17/21.
//

import Foundation

class User: ObservableObject{
    @Published var first_name: String?
    @Published var last_name: String?
    @Published var org_name: String?
    @Published var email: String
    @Published var phone_num: String
    @Published var address: String
    @Published var state: String
    @Published var city: String
    @Published var zipcode: String
    @Published var userName: String
    @Published var password: String
    
    init(first_name: String, last_name: String, org_name: String, email: String, phone_num: String,
         address: String, state: String, city: String, zipcode: String, username: String, password: String) {
        self.first_name = first_name
        self.last_name = last_name
        self.org_name = org_name
        self.email = email
        self.phone_num = phone_num
        self.address = address
        self.state = state
        self.city = city
        self.zipcode = zipcode
        self.userName = username
        self.password = password
    }
}
