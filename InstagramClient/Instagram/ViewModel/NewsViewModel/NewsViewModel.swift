//
//  NewsViewModel.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import Foundation

final class NewsViewModel: ObservableObject
{
    @Published var news: News?
    @Published var showNews: Bool = true
    
    init() {
        news = ApiService.newsApi.getLatestNews()
    }
}
