//
//  PostFood.swift
//  FoodDropApp
//
//  Created by Kibreab Gebrehiwot on 3/18/21.
//

import Foundation
import FirebaseAuth
import CoreLocation
import FirebaseFirestore
import FirebaseFirestoreSwift



public class PostFoodVM: ObservableObject {
    
    @Published var foodRepository = FoodRepository()
    private var db = Firestore.firestore()
    @Published var postedFoods = [Food_post]()
    
    func post_food(food_type: String, pickup_address: String,
                   madeOnDate: Date, pickup_date: Date, location: CLLocationCoordinate2D) -> Bool{
        
        if !validate_post(food_type: food_type, pickup_address: pickup_address, madeOnDate: madeOnDate, pickup_date: pickup_date) {
            return false
        }
        
        var userId: String?
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            userId = user?.uid
            
            let newFood = Food_post(ownerId:userId, foodType: food_type, pickupAddress: pickup_address, madeOnDate : madeOnDate.description, pickupDate: pickup_date.description, isClaimed: false, latitude: String(location.latitude), longitude: String(location.longitude))
            
            print("added Food")
            let _ = self.foodRepository.addFood(newFood)
        }
        
        return true

    }
    
    
    func validate_post(food_type: String, pickup_address: String, madeOnDate: Date, pickup_date: Date) -> Bool{
        
        if(food_type == "" || pickup_address == "" || madeOnDate >= pickup_date){
            return false
        }
        return true
    }
    
    
    func getPostedFoods() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            
            self.db.collection("foods").whereField("ownerId", isEqualTo: user?.uid ?? "").addSnapshotListener{ (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                self.postedFoods = documents.compactMap{ (queryDocumentSnapshot) -> Food_post? in
                    let data = try? queryDocumentSnapshot.data(as: Food_post.self)
                    return data
                }
            }
        }
        
    }

    
    
    
    
    
}
