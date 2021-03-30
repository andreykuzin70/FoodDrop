//
//  UserRepository.swift
//  FoodDropApp
//
//  Created by Natnael Mekonnen on 3/29/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserRepository: ObservableObject {
    let db = Firestore.firestore()
    @Published var users = [User_info]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        return
    }
    
    func addUser(_ user: User_info) -> Bool {
        do {
            let _ = try db.collection("users").addDocument(from: user)
            return true
        }
        catch {
          fatalError("Unable to encode user: \(error.localizedDescription).")
        }
    }
}
