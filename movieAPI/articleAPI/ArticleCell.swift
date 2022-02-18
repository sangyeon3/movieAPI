//
//  ArticleCell.swift
//  movieAPI
//
//  Created by  sangyeon on 2022/02/10.
//

import Foundation
import UIKit
import SnapKit

class ArticleCell: UITableViewCell{
    
    var headLineText = UILabel()
    var headLineImage = UIImageView()
    var articleToDisplay: Article?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        settingLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func displayArticle(article: Article){
        articleToDisplay = article
        headLineText.text = articleToDisplay!.title
        
        guard articleToDisplay!.urlToImage != nil else{
            return
        }
        let urlString = articleToDisplay!.urlToImage!
        let url = URL(string: urlString)
        guard url != nil else{
            print("couldn't create url object")
            return
        }
        
        let session = URLSession.shared
        let datatask = session.dataTask(with: url!) {(data, response, error) in
            if(error == nil && data != nil) {
                if(self.articleToDisplay!.urlToImage == urlString){
                    // image를 변경하는 작업은 UI를 변경하는 작업이므로 메인 스레드에서 돌려주어야 함
                    DispatchQueue.main.sync {
                        self.headLineImage.image = UIImage(data: data!)
                    }
                }
            }
        }
        datatask.resume()
    }
    
    private func settingLayout(){
        
        contentView.addSubview(headLineImage)
        headLineImage.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.height.width.equalTo(100)
        }
        
        contentView.addSubview(headLineText)
        headLineText.snp.makeConstraints{
            $0.top.leading.equalToSuperview()
            $0.trailing.equalTo(headLineImage.snp.leading)
            $0.height.equalTo(100)
        }
    }
}
