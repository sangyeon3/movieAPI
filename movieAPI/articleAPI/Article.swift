//
//  Article.swift
//  movieAPI
//
//  Created by  sangyeon on 2022/02/10.
//

import Foundation

struct Article: Codable{
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage: String?
    var publishedAt: String?
}
