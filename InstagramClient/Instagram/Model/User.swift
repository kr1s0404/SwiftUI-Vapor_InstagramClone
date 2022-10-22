//
//  User.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import Foundation

struct User: Identifiable
{
    var id = UUID()
    var name: String
    var posts: [Post]?
}

