//
//  User.swift
//  SwiftUIProject
//
//  Created by wjc on 2022/10/13.
//

import Foundation

struct User: Codable {
    var email: String
    
    var favoritePokemenIDs: Set<Int>
    
    func isFavoritePokemon(id: Int) -> Bool {
        favoritePokemenIDs.contains(id)
    }
}
