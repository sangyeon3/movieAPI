//
//  ArticleService.swift
//  movieAPI
//
//  Created by  sangyeon on 2022/02/10.
//

import Foundation

struct ArticleService: Codable{
    var status: String?
    var totalResults:Int?
    var articles:[Article]?
}
