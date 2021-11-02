//
//  NewsManager.swift
//  NewsFour
//
//  Created by MacBook on 01.11.2021.
//

import Foundation

struct NewsManager {
 
    
    private let keyAPI = "5da05c606b6846f7b5dbf3bd05653340"
    let initialURL: String
    
    // Hadling text from 
    init(text: String) {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.date(from: "yyyy-MM-DD")
        let currentDate = formatter.string(from: date)
        
        let initialURL = "https://newsapi.org/v2/everything?apiKey=\(keyAPI)&from=\(currentDate)&q=\(text)"
        
        self.initialURL = initialURL
    }
    
    func getData(completion: @escaping(Result<NewsDataModel, Error>) -> Void) {
        
        guard let url = URL(string: initialURL) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else { return }
            
            do {
                let data = try JSONDecoder().decode(NewsDataModel.self, from: data)
        
                    completion(.success(data))
                    print(data.articles)
                
                
            } catch { print(error) }
        }
        dataTask.resume()
        
    }
    
    
    
    
    
}


