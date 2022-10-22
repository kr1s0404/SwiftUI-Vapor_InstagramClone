//
//  PostView.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct PostView: View
{
    var width: CGFloat
    
    var body: some View
    {
        LazyVStack(alignment: .leading)
        {
            ForEach(PersonMock) { person in
                HStack
                {
                    Image(systemName: person.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
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
                
                Image("placeholder")
                    .resizable()
                    .scaledToFill()
                
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
                .padding(.bottom)
            }
        }
    }
}

struct PostView_Previews: PreviewProvider
{
    static var previews: some View
    {
        GeometryReader { proxy in
            let width = proxy.size.width / 3
            
            PostView(width: width)
        }
    }
}
