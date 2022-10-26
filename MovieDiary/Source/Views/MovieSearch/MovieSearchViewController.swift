//
//  MovieSearchViewController.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/25.
//

import UIKit

class MovieSearchViewController: UIViewController {
    
    var movieSearchList = [MovieList]()
    
    let searchBar = UISearchBar()
    
    let movieSearchView: MovieSearchView = {
        let view = MovieSearchView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubView()
        configure()
        setupTableView()
        setUpSearchBar()
        fetchData()
    }
    
    func fetchData() {
        Task {
            do {
                let searchResponse = try await BoxOfficeService().getSearchData(movieName: "메멘토")
                movieSearchList.append(contentsOf: searchResponse.movieListResult.movieList)
                print(movieSearchList)
            } catch {
                print(error.localizedDescription)
            }
            movieSearchView.movieSearchTableView.reloadData()
        }
    }

    func setupTableView() {
        movieSearchView.movieSearchTableView.delegate = self
        movieSearchView.movieSearchTableView.dataSource = self
        movieSearchView.movieSearchTableView.register(MovieSearchTableViewCell.self, forCellReuseIdentifier: "SearchCell")
        movieSearchView.movieSearchTableView.tableHeaderView = searchBar
    }
    
    func setUpSearchBar() {
        searchBar.delegate = self
        searchBar.frame = (CGRect(x: 0, y: 0, width: 200, height: 70))
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "영화이름을 검색해주세요"
    }
    
    func addSubView() {
        view.addSubview(movieSearchView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            
            movieSearchView.topAnchor.constraint(equalTo: view.topAnchor),
            movieSearchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieSearchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieSearchView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MovieSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieSearchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! MovieSearchTableViewCell
        let data = self.movieSearchList[indexPath.row]
        cell.movieNameLabel.text = data.movieNm
        cell.movieNameEnLabel.text = data.movieNmEn
        cell.movieInfoLabel.text = data.movieInfo
        cell.directorLabel.text = "감독 : \(MovieSearchHelper().directorNameHelper(data.directors))"
        return cell
    }
}

extension MovieSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        movieSearchView.movieSearchTableView.reloadData()
    }
}
