//
//  PostViewModel.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import Foundation

final class PostViewModel: ObservableObject
{
    @Published var posts: [Post]?
    
    
    func setUserPost(users: [User]) {
        guard let posts = ApiService.postApi.getMyPosts(users: users) else { return }
        self.posts = posts
    }
    
    func getUserPost(userID: UUID) -> Post? {
        guard let posts = posts else { return nil }
        return posts.first(where: { $0.owner.id == userID })
    }
}
