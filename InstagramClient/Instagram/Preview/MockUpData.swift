//
//  MockUpData.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import Foundation

class ApiService
{
    static let userApi = UserApi()
    static let postApi = PostApi()
    static let commentApi = CommentApi()
    static let newsApi = NewsApi()
}

class PostApi
{
    fileprivate static var posts: [Post] = [
        Post(image: "", desc: "", owner: UserApi.users[1], comments: [CommentApi.comments[1],
                                                                      CommentApi.comments[2],
                                                                      CommentApi.comments[3],
                                                                      CommentApi.comments[4]]),
        Post(image: "", desc: "", owner: UserApi.users[2], comments: [CommentApi.comments[1],
                                                                      CommentApi.comments[2],
                                                                      CommentApi.comments[3],
                                                                      CommentApi.comments[4]]),
        Post(image: "", desc: "", owner: UserApi.users[3], comments: [CommentApi.comments[1],
                                                                      CommentApi.comments[2],
                                                                      CommentApi.comments[3],
                                                                      CommentApi.comments[4]]),
        Post(image: "", desc: "", owner: UserApi.users[4], comments: [CommentApi.comments[1],
                                                                      CommentApi.comments[2],
                                                                      CommentApi.comments[3],
                                                                      CommentApi.comments[4]])
    ]
    
    func getMyPosts(users: [User]) -> [Post]? {
        PostApi.posts.filter { post in
            users.contains(where: { $0.id == post.owner.id })
        }
    }
}

class UserApi
{
    fileprivate static var users: [User] = [
        User(name: "Kris", image: "person.circle"),
        User(name: "May", image: "person.circle"),
        User(name: "Tony", image: "person.circle"),
        User(name: "Doris", image: "person.circle"),
        User(name: "Kenny", image: "person.circle"),
        User(name: "Troy", image: "person.circle")
    ]
    
    func getFollowing() -> [User] {
        UserApi.users
    }
    
    func addUser(user: User) {
        UserApi.users.append(user)
    }
    
    func updateUser(user: User) {
        guard var foundUser = UserApi.users.first(where: { $0.id == user.id }) else { return }
        foundUser.name = user.name
    }
}

class CommentApi
{
    fileprivate static var comments: [Comment] = [
        Comment(owner: UserApi.users[2], replyTo: UserApi.users[3], commentText: ""),
        Comment(owner: UserApi.users[1], replyTo: UserApi.users[2], commentText: ""),
        Comment(owner: UserApi.users[0], replyTo: UserApi.users[4], commentText: ""),
        Comment(owner: UserApi.users[4], replyTo: UserApi.users[1], commentText: ""),
        Comment(owner: UserApi.users[5], replyTo: UserApi.users[2], commentText: ""),
        Comment(owner: UserApi.users[3], replyTo: UserApi.users[4], commentText: ""),
        Comment(owner: UserApi.users[1], replyTo: UserApi.users[0], commentText: ""),
        Comment(owner: UserApi.users[2], replyTo: UserApi.users[4], commentText: ""),
        Comment(owner: UserApi.users[3], replyTo: UserApi.users[2], commentText: ""),
    ]
    
    func getComment() -> [Comment] {
        CommentApi.comments
    }
    
    func addComment(comment: Comment) {
        CommentApi.comments.append(comment)
    }
}

class NewsApi
{
    fileprivate static var news: [News] = [
        News(subject: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
    ]
    
    func getLatestNews() -> News? {
        NewsApi.news.last
    }
}
