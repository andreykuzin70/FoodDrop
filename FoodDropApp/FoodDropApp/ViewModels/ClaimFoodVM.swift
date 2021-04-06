//
//  ClaimFood.swift
//  FoodDropApp
//
//  Created by Shahryar shagoshtasbi on 3/31/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

public class ClaimFoodVM: ObservableObject {
    
    @Published var foods = [Food_post]()
    
    private var db = Firestore.firestore()
    
    func fetchFoods() {
        db.collection("foods").whereField("isClaimed", isEqualTo: false).addSnapshotListener{ (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.foods = documents.compactMap{ (queryDocumentSnapshot) -> Food_post? in
                let data = try? queryDocumentSnapshot.data(as: Food_post.self)
//                print("=====>\(data)")
                return data
            }
        }
    }
    
    // This is the function that will return an array, including all the foodposts data from Database
    func get_food() -> [Food_post]?{
        return nil;
//            Database.FoodPosts[id] ?? Database.FoodPosts("Lasagna", "123 Rockville", Date.init(), Date.init(timeIntervalSinceNow: 3600))
    }
    
}
