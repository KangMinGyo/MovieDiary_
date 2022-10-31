//
//  MovieReviewListViewController.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/24.
//

import UIKit

class MovieReviewListViewController: UIViewController {
    
    var reviewMetaDatas = [ReviewMetaData]()
    
    let movieReviewListView: MovieReviewListView = {
        let view = MovieReviewListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    lazy var settingButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: .gearshape),
                                     style: .plain,
                                     target: self,
                                     action: #selector(settingButtonPressed))
        button.tintColor = .gray
        return button
    }()
    
    lazy var movieSearchButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: .magnifyingglass),
                                     style: .plain,
                                     target: self,
                                     action: #selector(movieSearchButtonPressed))
        button.tintColor = .gray
        return button
    }()
    
    lazy var boxOfficeButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: .chart),
                                     style: .plain,
                                     target: self,
                                     action: #selector(boxOfficeButtonPressed))
        button.tintColor = .gray
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "리뷰 목록"
        navigationItem.leftBarButtonItem = settingButton
        navigationItem.rightBarButtonItems = [boxOfficeButton, movieSearchButton]

        addSubView()
        configure()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reviewMetaDatas = [ReviewMetaData]()
        loadData()
    }
    
    func loadData() {
        ReviewManager.shared.loadReviews(start: 0) { result in
            switch result {
            case .success(let metaDatas):
                self.reviewMetaDatas.append(contentsOf: metaDatas)
                self.movieReviewListView.MovieReviewListTableView.reloadData()
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func setupTableView() {
        movieReviewListView.MovieReviewListTableView.delegate = self
        movieReviewListView.MovieReviewListTableView.dataSource = self
        movieReviewListView.MovieReviewListTableView.register(MovieReviewListTableViewCell.self, forCellReuseIdentifier: "ReviewCell")
    }
    
    @objc func settingButtonPressed() {
        let nextVC = SettingViewController()
        self.show(nextVC, sender: self)
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
        return reviewMetaDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! MovieReviewListTableViewCell
        let data = reviewMetaDatas[indexPath.row]
        cell.movieNameLabel.text = data.title
        cell.movieInfoLabel.text = data.movieInfo
        cell.recordDateLabel.text = Date().reviewDate()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = MovieReviewDetailViewController()
        let data = reviewMetaDatas[indexPath.row]
        let evalImage = ReviewHelper().evalImage(data.eval ?? "")
        nextVC.title = data.title
        nextVC.movieReviewDetailView.reviewTextView.text = data.contents
        nextVC.movieReviewDetailView.evalImageView.image = UIImage(named: "\(evalImage)")
        self.show(nextVC, sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ReviewManager.shared.deleteReview(data: reviewMetaDatas[indexPath.row]) { result in
                switch result {
                case .success:
                    self.reviewMetaDatas.remove(at: indexPath.row)
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
                self.movieReviewListView.MovieReviewListTableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
}
