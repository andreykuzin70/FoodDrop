//
//  SideViewOptionModel.swift
//  FoodDropApp
//
//  Created by Andrey Kuzin on 3/31/21.
//

import Foundation

enum SideMenuOptionModel: Int, CaseIterable{
    case CreatePost
    case ClaimMeal
    case LogOut
    
    var title: String{
        switch self {
        case .CreatePost: return "My Posts"
        case .ClaimMeal: return "Claim a Meal"
        case .LogOut: return "Logout"
        }
    }
    
    var imageName: String{
        switch self {
        case .CreatePost: return "bookmark"
        case .ClaimMeal: return "cart.badge.plus"
        case .LogOut: return "arrow.left.square"
        }
    }

    
}
