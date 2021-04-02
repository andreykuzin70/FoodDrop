//
//  SideMenuOptionVM.swift
//  FoodDropApp
//
//  Created by Natnael Mekonnen on 4/1/21.
//

import Foundation

enum SideMenuOptionVM: Int, CaseIterable{
    case CreatePost
    case ClaimMeal
    case LogOut
    case FoodPosted
    case FoodClaimed
    
    var title: String{
        switch self {
        case .CreatePost: return "Make Post"
        case .ClaimMeal: return "Claim a Meal"
        case .LogOut: return "Logout"
        case .FoodPosted: return "Food Posted"
        case .FoodClaimed: return "Food Claimed"
        }
    }
    
    var imageName: String{
        switch self {
        case .CreatePost: return "bookmark"
        case .ClaimMeal: return "cart.badge.plus"
        case .LogOut: return "arrow.left.square"
        case .FoodPosted: return "tuningfork"
        case .FoodClaimed: return "rectangle.and.pencil.and.ellipsis"
        }
    }

    
}