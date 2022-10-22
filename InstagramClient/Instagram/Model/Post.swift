//
//  Post.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import Foundation

struct Post: Identifiable
{
    var id = UUID()
    var image: String
    var desc: String
    var owner: User
    var likesCount: Int = Int.random(in: 0 ..< 1000)
    var comments: [Comment]
}
