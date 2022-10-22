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
        Post(image: "Kris", desc: "This is Kris here", owner: UserApi.users[0], comments: [CommentApi.comments[1],
                                                                                 CommentApi.comments[2],
                                                                                 CommentApi.comments[3],
                                                                                 CommentApi.comments[4]]),
        Post(image: "May", desc: "This is May here", owner: UserApi.users[1], comments: [CommentApi.comments[4],
                                                                                 CommentApi.comments[5],
                                                                                 CommentApi.comments[6],
                                                                                 CommentApi.comments[7]]),
        Post(image: "Tony", desc: "This is Tony here", owner: UserApi.users[2], comments: [CommentApi.comments[6],
                                                                                 CommentApi.comments[7],
                                                                                 CommentApi.comments[8],
                                                                                 CommentApi.comments[1]])
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
        User(name: "Kris"),
        User(name: "May"),
        User(name: "Tony")
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
        Comment(owner: UserApi.users[0], replyTo: UserApi.users[1], commentText: "1111111111"),
        Comment(owner: UserApi.users[1], replyTo: UserApi.users[2], commentText: "222222222"),
        Comment(owner: UserApi.users[2], replyTo: UserApi.users[0], commentText: "33333333"),
        Comment(owner: UserApi.users[0], replyTo: UserApi.users[1], commentText: "4444444444444444"),
        Comment(owner: UserApi.users[1], replyTo: UserApi.users[2], commentText: "555555555555"),
        Comment(owner: UserApi.users[2], replyTo: UserApi.users[0], commentText: "66666"),
        Comment(owner: UserApi.users[0], replyTo: UserApi.users[1], commentText: "77777777777777777777"),
        Comment(owner: UserApi.users[1], replyTo: UserApi.users[2], commentText: "888888888888888"),
        Comment(owner: UserApi.users[2], replyTo: UserApi.users[0], commentText: "99999999999"),
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
