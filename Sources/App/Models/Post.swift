//
//  File.swift
//  
//
//  Created by Artemiy Zuzin on 08.06.2022.
//

import Foundation
import Vapor
import Fluent

final class Post: Model, Content {
    
    static let schema = "posts"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "image")
    var image: String
    
    @Field(key: "text")
    var text: String
    
    @Field(key: "likes")
    var likes: Int
    
    @Parent(key: "user_id")
    var user: User
    
    @Children(for: \.$post)
    var comments: [Comment]
    
    init() { }
    
    init(id: UUID? = nil, userID: User.IDValue, image: String, text: String = "", likes: Int = .zero) {
        self.id = id
        self.image = image
        self.text = text
        self.likes = likes
        self.$user.id = userID
    }
    
}
