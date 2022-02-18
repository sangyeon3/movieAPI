//
//  MovieViewController.swift
//  movieAPI
//
//  Created by  sangyeon on 2022/02/10.
//

import Foundation
import SwiftUI

class MovieListViewController: UIViewController {
    
    lazy var movieListCollectionView: UICollectionView = {[weak self] in
        let fl = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: fl)
        return cv
    }()
    
    let movieTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        tableViewSetting()
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieCell
        return cell
    }
    
    private func tableViewSetting(){
        view.addSubview(movieTableView)
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        movieTableView.register(MovieCell.self, forCellReuseIdentifier: "movieCell")
    }
}

class MovieCell: UITableViewCell{
    
    var title = UILabel()
    var rating = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        movieCellSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func movieCellSetting(){
        title.text = "title"
        rating.text = "9.9"
        
        contentView.addSubview(title)
        title.snp.makeConstraints{
            $0.leading.equalTo(contentView.safeAreaLayoutGuide).inset(20)
            $0.top.bottom.equalTo(contentView.safeAreaLayoutGuide).inset(10)
        }
        
        contentView.addSubview(rating)
        rating.snp.makeConstraints{
            $0.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(20)
            $0.top.bottom.equalTo(contentView.safeAreaLayoutGuide).inset(10)
        }
    }
    
}
