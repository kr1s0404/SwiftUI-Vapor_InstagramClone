//
//  Comment.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import Foundation

struct Comment: Identifiable
{
    var id = UUID()
    var owner: User?
    var replyTo: User?
    var commentText: String
}
