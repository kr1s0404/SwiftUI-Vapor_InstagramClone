//
//  CommentDetail.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct CommentDetail: View
{
    @FocusState var focused: Bool
    @Binding var commentText: String
    var user: User
    var post: Post
    
    var body: some View
    {
        VStack(alignment: .leading, spacing: 5)
        {
            VStack(alignment: .leading)
            {
                HStack
                {
                    Text(user.name)
                        .bold()
                        .foregroundColor(.primary)
                        .font(.headline)
                    Text(post.desc)
                        .font(.subheadline)
                        .opacity(0.8)
                }
                .padding(.bottom, 5)
                Text("1 hour age")
                    .foregroundColor(.secondary)
                    .font(.caption2)
            }
            .padding(.horizontal)
            
            Divider()
                .overlay(Color.primary)
                .padding(.vertical, 10)
            
            if let comments = post.comments {
                VStack(alignment: .leading)
                {
                    ForEach(comments) { comment in
                        HStack
                        {
                            HStack
                            {
                                Text(comment.owner.name)
                                    .bold()
                                    .foregroundColor(.primary)
                                    .font(.headline)
                                Text(comment.commentText)
                                    .font(.subheadline)
                                    .opacity(0.8)
                            }
                            Spacer()
                            Image(systemName: "heart")
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 5)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.bottom, 10)
    }
}

struct CommentDetail_Previews: PreviewProvider
{
    @State static var commentText: String = ""
    
    static var previews: some View
    {
        CommentDetail(commentText: $commentText,
                      user: ApiService.userApi.getFollowing().first!,
                      post: (ApiService.postApi.getMyPosts(users: ApiService.userApi.getFollowing())?.first)!)
    }
}
