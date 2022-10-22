//
//  PostFooter.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct PostFooter: View
{
    var isPostDetail: Bool
    var user: User
    var post: Post
    var width: CGFloat
    
    var body: some View
    {
        LazyVGrid(columns: [GridItem(.fixed(width)),
                            GridItem(.fixed(width)),
                            GridItem(.fixed(width))], alignment: .leading)
        {
            HStack(spacing: 20)
            {
                Image(systemName: "heart")
                
                if !isPostDetail {
                    NavigationLink {
                        PostDetailView(user: user, post: post, width: width)
                    } label: {
                        Image(systemName: "bubble.left")
                            .foregroundColor(.primary)
                    }
                }
                
                Image(systemName: "square.and.arrow.up")
            }
            Spacer()
            Image(systemName: "bookmark")
        }
        .font(.title2)
        .padding(.horizontal)
    }
}

struct PostFooter_Previews: PreviewProvider
{
    static var previews: some View
    {
        GeometryReader { proxy in
            let width = proxy.size.width / 2.77
            
            PostFooter(isPostDetail: true,
                       user: ApiService.userApi.getFollowing().first!,
                       post: (ApiService.postApi.getMyPosts(users: ApiService.userApi.getFollowing())?.first)!,
                       width: width)
        }
    }
}
