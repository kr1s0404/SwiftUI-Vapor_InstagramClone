//
//  NewsView.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct NewsView: View
{
    var body: some View
    {
        HStack
        {
            Image(systemName: "flag.square")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .font(.system(size: 12))
            
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: 12)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct NewsView_Previews: PreviewProvider
{
    static var previews: some View
    {
        NewsView()
            .previewLayout(.sizeThatFits)
    }
}
