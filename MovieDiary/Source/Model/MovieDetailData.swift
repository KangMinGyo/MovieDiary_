//
//  MovieDetailData.swift
//  BoxOffice
//
//  Created by KangMingyo on 2022/10/19.
//

import Foundation

struct MovieDetailData: Codable {
    let movieInfoResult: MovieInfoResult
}

struct MovieInfoResult: Codable {
    let movieInfo: MovieInfo
}

struct MovieInfo: Codable {
    let movieNm: String
    let movieNmEn: String
    let showTm: String //상영시간
    let openDt: String //개봉날짜
    let genres: [Genres] //장르
}

struct Genres: Codable {
    let genreNm: String
}

