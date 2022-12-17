//
//  BoxOfficeViewController.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/24.
//

import UIKit

class BoxOfficeViewController: UIViewController {
    
    var boxOfficeHelper = BoxOfficeHelper()
    var boxOfficeDataList = [DailyBoxOfficeList]()
    var movieDetailDataList = [MovieInfo]()
    var moviePosterData = [String]()
    var movieBackdropData = [String]()
    
    let posterBaseURL = "https://image.tmdb.org/t/p/original"

    let boxOfficeView: BoxOfficeView = {
        let view = BoxOfficeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = I18NString.Title.boxOfficeTitle

        fetchData()
        addSubView()
        configure()
        setupTableView()
    }
    
    func fetchData() {
        Task {
            do {
                let movieResponse = try await BoxOfficeService().getBoxOfficeData(date: Date().yesterdayDate())
                boxOfficeDataList.append(contentsOf: movieResponse.boxOfficeResult.dailyBoxOfficeList)
                boxOfficeView.boxOfficeTableView.reloadData()
                for index in 0..<boxOfficeDataList.count {
                    let movieCode = boxOfficeDataList[index].movieCd
                    let movieDetailResponse = try await BoxOfficeService().getMovieDetailData(movieCode: movieCode).movieInfoResult.movieInfo
                    movieDetailDataList.append(movieDetailResponse)
                    let movieName = boxOfficeDataList[index].movieNm
                    do {
                        let posterResponse = try await BoxOfficeService().getMoviePosterData(movieName: movieName)
                        if posterResponse.results.count == 0 {
                            moviePosterData.append(posterBaseURL)
                            movieBackdropData.append(posterBaseURL)
                        } else {
                            moviePosterData.append(posterResponse.results[0].poster_path ?? "")
                            movieBackdropData.append(posterResponse.results[0].backdrop_path ?? "")
                        }
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
            boxOfficeView.boxOfficeTableView.reloadData()
        }
    }
    
    func setupTableView() {
        boxOfficeView.boxOfficeTableView.delegate = self
        boxOfficeView.boxOfficeTableView.dataSource = self
        boxOfficeView.boxOfficeTableView.register(BoxOfficeTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func addSubView() {
        view.addSubview(boxOfficeView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            
            boxOfficeView.topAnchor.constraint(equalTo: view.topAnchor),
            boxOfficeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            boxOfficeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            boxOfficeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension BoxOfficeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxOfficeDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BoxOfficeTableViewCell
        let data = self.boxOfficeDataList[indexPath.row]
        
        cell.selectionStyle = .none

        cell.movieName.text = data.movieNm
        cell.openDate.text = data.openDt
        cell.boxOfficeRank.text = "\(data.rank)"
        cell.rankInten.text = boxOfficeHelper.rankIntenCal(data.rankInten)
        cell.audiAcc.text = boxOfficeHelper.audiAccCal(data.audiAcc)

        DispatchQueue.main.async {
            if self.moviePosterData.count != 10 {
                cell.posterImageView.setImageUrl(url: self.posterBaseURL, movieName: "noPoster")
                
            } else {
                cell.posterImageView.setImageUrl(url: "\(self.posterBaseURL)"+"\(self.moviePosterData[indexPath.row])", movieName: data.movieNm)
            }
        }

        return cell
    }
}
