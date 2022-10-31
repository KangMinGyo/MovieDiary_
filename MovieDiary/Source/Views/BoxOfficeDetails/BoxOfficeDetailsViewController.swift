//
//  BoxOfficeDetailsViewController.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/24.
//

import UIKit

class BoxOfficeDetailsViewController: UIViewController {

    var boxOfficeDataList = [DailyBoxOfficeList]()
    var movieDetailDataList = [MovieInfo]()
    var boxOfficeHelper = BoxOfficeHelper()
    var index: Int?
    var actorArr = ""
    
    let boxOfficeDetailsView: BoxOfficeDetailsView = {
        let view = BoxOfficeDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        addSubView()
        configure()
    }

    func setupLabels() {
        let data = boxOfficeDataList[index ?? 0]
        let detailData = movieDetailDataList[index ?? 0]
        boxOfficeDetailsView.movieName.text = detailData.movieNm
        boxOfficeDetailsView.movieNameEn.text = detailData.movieNmEn
        boxOfficeDetailsView.genresAndShowTime.text = "\(detailData.genres[0].genreNm) | \(detailData.showTm)분"
        boxOfficeDetailsView.openDate.text = "\(data.openDt) 개봉"
        boxOfficeDetailsView.boxOfficeRank.text = "\(data.rank)"
        boxOfficeDetailsView.rankInten.text = boxOfficeHelper.rankIntenCal(data.rankInten)
        boxOfficeDetailsView.audiAcc.text = boxOfficeHelper.audiAccCal(data.audiAcc)
    }
    
    func addSubView() {
        view.addSubview(boxOfficeDetailsView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            boxOfficeDetailsView.topAnchor.constraint(equalTo: view.topAnchor),
            boxOfficeDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            boxOfficeDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            boxOfficeDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
