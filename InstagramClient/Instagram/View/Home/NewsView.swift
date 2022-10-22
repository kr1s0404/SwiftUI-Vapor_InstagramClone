//
//  NewsView.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct NewsView: View
{
    @StateObject var vm = NewsViewModel()
    
    var body: some View
    {
        if vm.showNews {
            if let newsText = vm.news?.subject {
                HStack
                {
                    Image(systemName: "flag.square")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                    
                    Text(newsText)
                        .font(.system(size: 12))
                    
                    Button {
                        withAnimation(.easeInOut) {
                            vm.showNews.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(10)
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider
{
    static let vm = NewsViewModel()
    
    static var previews: some View
    {
        NewsView()
            .environmentObject(vm)
            .previewLayout(.sizeThatFits)
    }
}
