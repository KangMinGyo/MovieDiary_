//
//  ReviewManager.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/28.
//

import Foundation

protocol ReviewManagerProtocol {
    
    func saveReview(title: String, contents: String, movieInfo: String, eval: String, completion: @escaping (Result<ReviewMetaData, Error>) -> ())
    
    func loadReviews(start: Int, completion: @escaping (Result<[ReviewMetaData], Error>) -> ())
    
    func deleteReview(data: ReviewMetaData, completion: @escaping (Result<Void, Error>) -> ())

}

class ReviewManager: ReviewManagerProtocol {
    
    static let shared = ReviewManager()
    
    private init() { }
    
    func saveReview(title: String, contents: String, movieInfo: String, eval: String, completion: @escaping (Result<ReviewMetaData, Error>) -> ()) {
        DispatchQueue.global().async {
            do {
                let metaData = try CoreDataManger.shared.createNewReview(
                    title: title,
                    contents: contents,
                    movieInfo: movieInfo,
                    eval: eval)
                try CoreDataManger.shared.insertReviewMataData(metaData)
                DispatchQueue.main.async {
                    completion(.success(metaData))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func loadReviews(start: Int, completion: @escaping (Result<[ReviewMetaData], Error>) -> ()) {
        DispatchQueue.global().async {
            do {
                let metaDatas = try CoreDataManger.shared.fetchReviewMataData(start: start)
                DispatchQueue.main.async {
                    completion(.success(metaDatas))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func deleteReview(data: ReviewMetaData, completion: @escaping (Result<Void, Error>) -> ()) {
        DispatchQueue.global().async {
            do {
                try CoreDataManger.shared.deleteReviewMetaData(data)
                DispatchQueue.main.async {
                    completion(.success(()))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
