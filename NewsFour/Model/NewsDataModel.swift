//
//  NewsDataModel.swift
//  NewsFour
//
//  Created by MacBook on 01.11.2021.
//

import Foundation


struct NewsDataModel: Codable {
    
    let articles: [Articles]
}

struct Articles: Codable {
    
    let source: Name
    let description: String
    let publishedAt: String
    let url: String
    let urlToImage: String
    
}
struct Name: Codable {
    let publisher: String
    
    enum CodingKeys: String, CodingKey {
        case publisher = "name"
    }
}
