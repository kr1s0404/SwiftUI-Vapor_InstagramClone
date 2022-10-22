//
//  PostDetailView.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct PostDetailView: View
{
    @State var commentText: String = ""
    var user: User
    var post: Post
    var width: CGFloat
    
    var body: some View
    {
        ScrollView
        {
            LazyVStack(alignment: .leading)
            {
                
                CommentDetail(commentText: $commentText, user: user, post: post)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("留言")
    }
}

extension PostDetailView {
    
}

struct PostDetailView_Previews: PreviewProvider
{
    static var previews: some View
    {
        GeometryReader { proxy in
            let width = proxy.size.width / 2.4
            
            NavigationView
            {
                PostDetailView(user: ApiService.userApi.getFollowing().first!,
                               post: (ApiService.postApi.getMyPosts(users: ApiService.userApi.getFollowing())?.first)!,
                               width: width)
            }
        }
    }
}
