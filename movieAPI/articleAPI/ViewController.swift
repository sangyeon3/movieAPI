//
//  ViewController.swift
//  movieAPI
//
//  Created by  sangyeon on 2022/02/08.
//

import UIKit
import SwiftUI

//class ViewController: UIViewController {
//
//    var data: DataClass = DataClass()
//    var model = MovieModel()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        model.delegate = self
//        model.getData()
//    }
//
//}
//
//extension ViewController: MovieModelProtocol{
//    // MARK: MovieModelProtocol functions
//    func dataRetrieved(data:DataClass) {
//        print("data retrieved from movie model!")
//        self.data = data
//    }
//}
//

class ViewController: UIViewController {
    
    var articles = [Article]()
    var model = ArticleModel()
    
    let articleTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
        model.getArticles()
        
        view.backgroundColor = .red
        settingTableView()
    }
    
}

extension ViewController: ArticleModelProtocol{
    func articlesRetrieved(articles: [Article]) {
        print("articles retrieved")
        self.articles = articles
        // API 데이터를 받아온 후 tableView가 데이터를 새로 받아오도록 함
        articleTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
        
        let article = self.articles[indexPath.row]
        cell.displayArticle(article: article)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    
    private func settingTableView(){
        self.view.addSubview(articleTableView)
        articleTableView.delegate = self
        articleTableView.dataSource = self
        articleTableView.backgroundColor = .blue
        
        articleTableView.register(ArticleCell.self, forCellReuseIdentifier: "articleCell")
        articleTableView.snp.makeConstraints{
            $0.leading.top.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
