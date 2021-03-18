//
//  userList.swift
//  FoodDropApp
//
//  Created by Andrey Kuzin on 3/17/21.
//

import Foundation

class UserList: ObservableObject{
    @Published var users: [User]
    
    init() {
        self.users = []
    }
    
    func addShow(_ user: User) {
        users.append(user)
    }
    
}
