//
//  File.swift
//  
//
//  Created by Artemiy Zuzin on 25.06.2022.
//

import Foundation
import Fluent

struct CreateUserToken: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema("user_tokens")
            .id()
            .field("value", .string, .required)
            .field("user_id", .uuid, .required, .references("users", "id"))
            .unique(on: "value")
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("user_tokens").delete()
    }
    
}
