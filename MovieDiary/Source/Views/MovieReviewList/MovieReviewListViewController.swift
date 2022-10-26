//
//  MovieReviewListViewController.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/24.
//

import UIKit

class MovieReviewListViewController: UIViewController {
    
    lazy var movieSearchButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(movieSearchButtonPressed))
        return button
    }()
    
    lazy var boxOfficeButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chart.bar"), style: .plain, target: self, action: #selector(boxOfficeButtonPressed))
        return button
    }()
    
    let movieReviewListView: MovieReviewListView = {
        let view = MovieReviewListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "영화 리뷰 목록"
        navigationItem.rightBarButtonItems = [boxOfficeButton, movieSearchButton]

        addSubView()
        configure()
        setupTableView()
    }
    
    func setupTableView() {
        movieReviewListView.MovieReviewListTableView.delegate = self
        movieReviewListView.MovieReviewListTableView.dataSource = self
        movieReviewListView.MovieReviewListTableView.register(MovieReviewListTableViewCell.self, forCellReuseIdentifier: "ReviewCell")
    }
    
    @objc func boxOfficeButtonPressed() {
        let nextVC = BoxOfficeViewController()
        self.show(nextVC, sender: self)
    }
    
    @objc func movieSearchButtonPressed() {
        let nextVC = MovieSearchViewController()
        self.show(nextVC, sender: self)
    }
    
    func addSubView() {
        view.addSubview(movieReviewListView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            
            movieReviewListView.topAnchor.constraint(equalTo: view.topAnchor),
            movieReviewListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieReviewListView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieReviewListView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension MovieReviewListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! MovieReviewListTableViewCell
        
        return cell
    }
    
}
