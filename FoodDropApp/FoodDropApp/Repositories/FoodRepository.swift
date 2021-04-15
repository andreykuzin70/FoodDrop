//
//  FoodRepository.swift
//  FoodDropApp
//
//  Created by Natnael Mekonnen on 3/30/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FoodRepository: ObservableObject {
    let db = Firestore.firestore()
    @Published var foods = [Food_post]()
    
    init() {
        loadFood()
    }
    
    func loadFood() {
        db.collection("foods").addSnapshotListener { (querySnapshot, error) in
             if let querySnapshot = querySnapshot {
                self.foods = querySnapshot.documents.compactMap { document in
                    do {
                        let _ = try document.data(as: Food_post.self)
                    } catch {
                        fatalError("Unable to encode food: \(error.localizedDescription).")
                    }
                    return nil
                }
            }
        }
        print("data loaded")
    }
    
    
    
    func addFood(_ food: Food_post) -> Bool {
        do {
            let _ = try db.collection("foods").addDocument(from: food)
            print("Food: \(food)")
            return true
        }
        catch {
          fatalError("Unable to encode food: \(error.localizedDescription).")
        }
    }
}
