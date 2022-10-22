//
//  CommentSection.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct CommentSection: View
{
    @FocusState var focused: Bool
    @Binding var commentText: String
    var user: User
    var post: Post
    
    var body: some View
    {
        VStack(alignment: .leading, spacing: 5)
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
            
            if let comments = post.comments {
                VStack(alignment: .leading)
                {
                    Text("View all \(comments.count) comments")
                        .foregroundColor(.secondary)
                        .font(.caption)
                    
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
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            
            HStack
            {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                TextField("Add a comment", text: $commentText)
                    .focused($focused)
                emojiButton("🥰")
                emojiButton("🤩")
            }
            Text("1 hour age")
                .foregroundColor(.secondary)
                .font(.caption2)
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
    
    func emojiButton(_ emoji: String) -> Button<Text> {
        Button {
            withAnimation(.spring()) {
                focused = true
                commentText += emoji
            }
        } label: {
            Text(emoji)
        }
    }
}

struct CommentSection_Previews: PreviewProvider
{
    @State static var commentText: String = ""
    
    static var previews: some View
    {
        CommentSection(commentText: $commentText,
                       user: ApiService.userApi.getFollowing().first!,
                       post: (ApiService.postApi.getMyPosts(users: ApiService.userApi.getFollowing())?.first)!)
    }
}
