//
//  Database.swift
//  FoodDropApp
//
//  Created by Kibreab Gebrehiwot on 3/17/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

public struct User_info: Codable, Identifiable {
    @DocumentID public var id: String?
    var userId: String?
    var firstName: String?
    var lastName: String?
    var orgName: String?
    var email: String
    var phoneNum: String
    var address: String
    var state: String
    var city: String
    var zipcode: String
    var password: String
    
}


public struct Food_post: Codable, Identifiable, Hashable {
    @DocumentID public var id: String?
    var ownerId: String?
    var foodType: String
    var pickupAddress: String
    var madeOnDate: String
    var pickupDate: String
    var isClaimed: Bool
    var claimerId: String?
    var latitude: String
    var longitude: String
    var ImageId: String
}
