//
//  ArticleModel.swift
//  movieAPI
//
//  Created by  sangyeon on 2022/02/10.
//

import Foundation

protocol ArticleModelProtocol{
    func articlesRetrieved(articles:[Article])
}

class ArticleModel{
    
    var delegate:ArticleModelProtocol?
    
    func getArticles(){
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=bb8e4fcfd4bc4ea4a1ba2b1b105a592f"
        let url = URL(string: urlString)
        guard url != nil else{
            print("Couldn't create url object")
            return
        }
        
        let session = URLSession.shared
        let datatask = session.dataTask(with: url!) {(data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do{
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    DispatchQueue.main.sync {
                        self.delegate?.articlesRetrieved(articles: articleService.articles!)
                    }
                } catch {
                    print("Error parsing")
                }
            }
        }
        datatask.resume()
    }
    
}
