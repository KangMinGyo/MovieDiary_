//
//  MovieReviewDetailViewController.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/28.
//

import UIKit

class MovieReviewDetailViewController: UIViewController {
    
    let movieReviewDetailView: MovieReviewDetailView = {
        let view = MovieReviewDetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubView()
        configure()
        
    }
    
    func addSubView() {
        view.addSubview(movieReviewDetailView)
    }

    func configure() {
        NSLayoutConstraint.activate([
            
            movieReviewDetailView.topAnchor.constraint(equalTo: view.topAnchor),
            movieReviewDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieReviewDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieReviewDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
