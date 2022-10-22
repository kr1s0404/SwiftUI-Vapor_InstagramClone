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
    
    var width: CGFloat
    
    @State var commentText: String = ""
    @State var showSubTextField: Bool = false
    @State var keyboardHeight: CGFloat = 0
    @FocusState var focused: Bool
    
    var body: some View
    {
        LazyVStack(alignment: .leading)
        {
            ForEach(vm.following) { person in
                
                PostHeader(person: person)
                
                PostImage(person: person)
                
                PostFooter(person: person)
                
                LikesSection()
                
                CommentSection(person: person)
            }
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                DoneButton(focused: _focused)
            }
        }
    }
    
    func emojiButton(_ emoji: String) -> Button<Text> {
        Button {
            withAnimation(.spring()) {
                focused = true
                showSubTextField ? (showSubTextField = false) : (showSubTextField = true)
                commentText += emoji
            }
        } label: {
            Text(emoji)
        }
    }
}

extension PostView {
    @ViewBuilder
    func PostHeader(person: User) -> some View {
        HStack
        {
            Image(systemName: person.image)
                .resizable()
                .scaledToFit()
                .frame(width: 40)
                .padding(3)
                .clipShape(Circle())
                .overlay(Circle().stroke(.green, lineWidth: 2))
            VStack(alignment: .leading)
            {
                Text(person.name)
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
    
    @ViewBuilder
    func PostImage(person: User) -> some View {
        Image("placeholder")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    func PostFooter(person: User) -> some View {
        LazyVGrid(columns: [GridItem(.fixed(width)),
                            GridItem(.fixed(width)),
                            GridItem(.fixed(width))])
        {
            HStack(spacing: 20)
            {
                Image(systemName: "heart")
                Image(systemName: "magnifyingglass")
                Image(systemName: "square.and.arrow.up")
            }
            Spacer()
            Image(systemName: "bookmark")
        }
        .font(.title2)
    }
    
    @ViewBuilder
    func LikesSection() ->  some View {
        Text("300 Likes")
            .font(.callout)
            .padding(.horizontal)
    }
    
    @ViewBuilder
    func CommentSection(person: User) -> some View {
        VStack(alignment: .leading, spacing: 5)
        {
            HStack
            {
                HStack
                {
                    Text(person.name)
                        .bold()
                        .foregroundColor(.primary)
                        .font(.headline)
                    Text("好頂喔")
                        .font(.subheadline)
                        .opacity(0.8)
                }
                Spacer()
                Image(systemName: "heart")
                    .foregroundColor(.secondary)
            }
            Text("View all 10 comments")
                .foregroundColor(.secondary)
                .font(.caption)
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
    
    
}


struct PostView_Previews: PreviewProvider
{
    static let vm = StoreData()
    
    static var previews: some View
    {
        GeometryReader { proxy in
            let width = proxy.size.width / 2.77
            
            PostView(width: width)
                .environmentObject(vm)
        }
    }
}
