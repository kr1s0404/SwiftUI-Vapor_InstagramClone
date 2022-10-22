//
//  NavigationBar.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct NavigationBar: View
{
    var width: CGFloat
    
    var body: some View
    {
        LazyVGrid(columns: [GridItem(.fixed(width)),
                            GridItem(.fixed(width)),
                            GridItem(.fixed(width))])
        {
            Spacer()
            Text("Kris")
                .font(Font.instagram.nav)
            Image(systemName: "paperplane")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
        }
        .navigationBarHidden(true)
    }
}

struct NavigationBar_Previews: PreviewProvider
{
    static var previews: some View
    {
        GeometryReader { proxy in
            let width = proxy.size.width / 3
            NavigationBar(width: width)
        }
    }
}
