//
//  MovieReviewListView.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/24.
//

import UIKit

class MovieReviewListView: UIView {
        
    let MovieReviewListTableView: UITableView = {
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
        addSubview(MovieReviewListTableView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
        MovieReviewListTableView.topAnchor.constraint(equalTo: topAnchor),
        MovieReviewListTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        MovieReviewListTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        MovieReviewListTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
