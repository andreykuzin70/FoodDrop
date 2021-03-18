//
//  FoodPostList.swift
//  FoodDropApp
//
//  Created by Andrey Kuzin on 3/18/21.
//

import Foundation

class FoodPostList: ObservableObject{
    @Published var posts: [FoodPost]
    
    init() {
        self.posts = []
    }
    
    func addShow(_ post: FoodPost) {
        posts.append(post)
    }
}
