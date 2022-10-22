//
//  PostHeader.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct PostHeader: View
{
    var user: User
    
    var body: some View
    {
        HStack
        {
            Image(user.name)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .padding(3)
                .clipShape(Circle())
                .overlay(Circle().stroke(.green, lineWidth: 2))
            VStack(alignment: .leading)
            {
                Text(user.name)
                    .font(.system(size: 12))
                Text("Location")
                    .font(.system(size: 12))
            }
            Spacer()
            Image(systemName: "ellipsis")
                .resizable()
                .scaledToFit()
                .frame(width: 15)
        }
        .padding(.horizontal)
    }
}

struct PostHeader_Previews: PreviewProvider {
    static var previews: some View {
        PostHeader(user: ApiService.userApi.getFollowing().first!)
    }
}
