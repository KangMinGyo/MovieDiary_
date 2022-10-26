//
//  MovieSearchView.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/25.
//

import UIKit

class MovieSearchView: UIView {

    let movieSearchTableView: UITableView = {
         let tableView = UITableView()
         tableView.rowHeight = 100
         tableView.translatesAutoresizingMaskIntoConstraints = false
         return tableView
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        configure()
    }
    
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(movieSearchTableView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            
            movieSearchTableView.topAnchor.constraint(equalTo: topAnchor),
            movieSearchTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieSearchTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieSearchTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
