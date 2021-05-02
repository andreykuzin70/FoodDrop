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
import FirebaseStorage

public class ClaimFoodVM: ObservableObject {
    
    @Published var foodRepository = FoodRepository()
    @Published var foods = [Food_post]()
    @Published var foodRatings: [Int] = []
    @Published var foodImages: [String: UIImage] = [:]
    @Published var claimedFoods = [Food_post]()
    
    private var db = Firestore.firestore()
    
    func fetchFoods() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            self.db.collection("foods")
                .whereField("isClaimed", isEqualTo: false)
                .whereField("ownerId", isNotEqualTo: user?.uid ?? "")
                .addSnapshotListener{ (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                
                self.foods = documents.compactMap{ (queryDocumentSnapshot) -> Food_post? in
                    let data = try? queryDocumentSnapshot.data(as: Food_post.self)
                    self.getImage(imageName: data!.imageId, foodId: (data?.id)!)
                    return data
                }
                
//                self.foodImages = documents.compactMap{ (queryDocumentSnapshot) -> Food_post? in
//                    return [:]
//                }
            }
        }
    }
    
    func getClaimedFoods() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            
            self.db.collection("foods").whereField("claimerId", isEqualTo: user?.uid ?? "").addSnapshotListener{ (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                self.claimedFoods = documents.compactMap{ (queryDocumentSnapshot) -> Food_post? in
                    let data = try? queryDocumentSnapshot.data(as: Food_post.self)
                    self.foodRatings.append(0)
                    return data
                }
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
    
    func getImage(imageName: String, foodId: String){
        Storage.storage().reference().child(imageName).getData(maxSize: 1 * 1024 * 1024) { (result, error) in
            if let _ = error{
                print("Error at image retrival")
            } else {
                if let imageData = result{
                    self.foodImages[foodId] = UIImage(data: imageData)
                } else {
                    print("can not unwrape image(null)")
                }
            }
        }
        
        
    }
    
}

//func getImage(imageName: String) -> Bool{
//    //self.images[imageName] = UIImage(imageLiteralResourceName: "food-icon")
//
//    claimFoodVM.getImage(imageName: imageName ){(result, error) in
//        if let _ = error{
//            print("Error at image retrival")
//        }else{
//            if let imageData = result{
//                self.images[imageName] = UIImage(data: imageData)
//            }else{
//                print("can not unwrape image(null)")
//            }
//        }
//
//
//    }
//    return true;
//}
