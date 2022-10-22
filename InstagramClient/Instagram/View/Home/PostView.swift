//
//  PostView.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct PostView: View
{
    @EnvironmentObject var vm: StoreData
    @StateObject var postVM = PostViewModel()
    
    @State var commentText: String = ""
    @FocusState var focused: Bool
    
    var width: CGFloat
    
    var body: some View
    {
        LazyVStack(alignment: .leading)
        {
            ForEach(vm.following) { person in
                
                if let post = postVM.getUserPost(userID: person.id) {
                    PostHeader(user: person)
                    
                    PostImage(user: person)
                        .environmentObject(postVM)
                    
                    PostFooter(isPostDetail: false, user: person, post: post, width: width)
                    
                    LikesCount(post: post)
                    
                    CommentSection(commentText: $commentText, user: person, post: post)
                }
            }
        }
        .onAppear {
            postVM.setUserPost(users: vm.following)
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                DoneButton(focused: _focused)
            }
        }
    }
    
    
}

extension PostView {
    
}


struct PostView_Previews: PreviewProvider
{
    static let vm = StoreData()
    static let postVM = PostViewModel()
    
    static var previews: some View
    {
        GeometryReader { proxy in
            let width = proxy.size.width / 2.4
            ScrollView
            {
                PostView(width: width)
                    .environmentObject(vm)
                    .environmentObject(postVM)
            }
        }
    }
}
