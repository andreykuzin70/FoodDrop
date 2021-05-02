//
//  FoodRepository.swift
//  FoodDropApp
//
//  Created by Natnael Mekonnen on 3/30/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

class FoodRepository: ObservableObject {
    let db = Firestore.firestore()
    @Published var foods = [Food_post]()
    
//    init() {
//        loadFood()
//    }
    
    func loadFood() {
        print("I am at Loading Foods ")
        db.collection("foods").addSnapshotListener { (querySnapshot, error) in
             if let querySnapshot = querySnapshot {
                self.foods = querySnapshot.documents.compactMap { document in
                    do {
                        let _ = try document.data(as: Food_post.self)
                    } catch {
                        fatalError("Unable to encode food: \(error.localizedDescription).")
                    }
                    print("All foods are not loaded")
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
        } catch {
          fatalError("Unable to encode food: \(error.localizedDescription).")
        }
    }
    
    func updateFood(updatedFood food: Food_post) -> Bool {
        do {
            let _ = try db.collection("foods").document(food.id!).setData(from: food)
            print("Updated food: \(food)")
            return true
        } catch {
            fatalError("Unable to encode food: \(error.localizedDescription).")
        }
    }
    
    
    func uploadImage(image:UIImage, imageName: String){
        
        if let imageData = image.jpegData(compressionQuality: 0.5){
           let storage = Storage.storage()
            
            storage.reference().child(imageName).putData(imageData, metadata: nil){ (_, error) in
                if let error = error {
                    print("Error Uploading ---  \(error.localizedDescription)")
                }else{
                    print("Successful uploading ")
                }
                
            }
        }
        else{
            print("can not create JPEG image")
        }
    }
    
}
