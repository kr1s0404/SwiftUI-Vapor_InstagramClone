//
//  PostImage.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct PostImage: View
{
    @EnvironmentObject var postVM: PostViewModel
    
    var user: User
    
    var body: some View
    {
        if let image = postVM.getUserPost(userID: user.id)?.image {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
        } else {
            Image("placeholder")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
        }
    }
}

struct PostImage_Previews: PreviewProvider
{
    static let postVM = PostViewModel()
    
    static var previews: some View
    {
        PostImage(user: ApiService.userApi.getFollowing().first!)
            .environmentObject(postVM)
    }
}
