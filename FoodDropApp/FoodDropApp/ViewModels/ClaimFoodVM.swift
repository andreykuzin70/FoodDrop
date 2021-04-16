//
//  ClaimFood.swift
//  FoodDropApp
//
//  Created by Shahryar shagoshtasbi on 3/31/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

public class ClaimFoodVM: ObservableObject {
    
    @Published var foodRepository = FoodRepository()
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
                return data
            }
        }
    }
    
    func claimFood(food: Food_post) -> Bool {
        var food = food
        var res = true
        Auth.auth().addStateDidChangeListener { (auth, user) in
            food.claimerId = user?.uid
            food.isClaimed = true
            
            print("Updated Food")
            res = self.foodRepository.updateFood(updatedFood: food)
        }
        return res
    }
    
}
