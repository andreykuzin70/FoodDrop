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
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.users = querySnapshot.documents.compactMap { document in
                    do {
                        let x = try document.data(as: User_info.self)
                        Database.add_user(user: x!)
                    } catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
        print("data loaded")
    }
}
