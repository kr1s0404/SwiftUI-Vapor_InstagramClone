//
//  SwiftUIView.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct LikesCount: View
{
    var post: Post
    
    var body: some View
    {
        Text("\(post.likesCount) likes")
            .font(.callout)
            .padding(.horizontal)
    }
}
