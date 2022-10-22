//
//  StoryView.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct StoryView: View
{
    @EnvironmentObject var vm: StoreData
    
    var body: some View
    {
        VStack
        {
            ScrollView(.horizontal, showsIndicators: false)
            {
                LazyHStack(spacing: 10)
                {
                    MyStory()
                    
                    FollowingStory()
                }
                .frame(height: 90)
            }
        }
    }
}

extension StoryView {
    @ViewBuilder
    func MyStory() -> some View {
        VStack
        {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .padding(3)
                .clipShape(Circle())
                .overlay(Circle().stroke(.green, lineWidth: 2))
            Text("Your story")
                .font(.system(size: 12))
                .lineLimit(1)
        }
        .frame(width: 65)
        .padding(.leading)
    }
    
    @ViewBuilder
    func FollowingStory() -> some View {
        ForEach(vm.following) { person in
            VStack
            {
                ZStack
                {
                    Image(systemName: person.image)
                        .resizable()
                        .scaledToFit()
                        .padding(3)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.green, lineWidth: 2))
                }
                Text(person.name)
                    .font(.system(size: 12))
                    .lineLimit(1)
            }
            .frame(width: 65)
        }
    }
}

struct StoryView_Previews: PreviewProvider
{
    static let vm = StoreData()
    
    static var previews: some View
    {
        ContentView()
            .environmentObject(vm)
    }
}
