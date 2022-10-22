//
//  StoryView.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct StoryView: View
{
    var body: some View
    {
        VStack
        {
            ScrollView(.horizontal, showsIndicators: false)
            {
                LazyHStack(spacing: 10)
                {
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
                    
                    ForEach(PersonMock) { person in
                        VStack
                        {
                            Image(systemName: person.image)
                                .resizable()
                                .scaledToFit()
                                .padding(3)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(.green, lineWidth: 2))
                            Text(person.name)
                                .font(.system(size: 12))
                                .lineLimit(1)
                        }
                        .frame(width: 65)
                    }
                }
            }
        }
        .padding(.bottom)
    }
}

struct StoryView_Previews: PreviewProvider
{
    static var previews: some View
    {
        StoryView()
    }
}
