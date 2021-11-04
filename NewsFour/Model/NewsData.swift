//
//  NewsData.swift
//  NewsFour
//
//  Created by MacBook on 04.11.2021.
//

import Foundation

struct NewsData {
    
    var newsDescription: String
    var newsImage: String
    var publishedAt: String
    var publisher: String
    var url: String
    
    init(newsDescription: String, newsImage: String, publishedAt: String, publisher: String, url: String) {
        self.newsDescription = newsDescription
        self.newsImage = newsImage
        self.publisher = publisher
        self.publishedAt = publishedAt
        self.url = url
    }
    
}
