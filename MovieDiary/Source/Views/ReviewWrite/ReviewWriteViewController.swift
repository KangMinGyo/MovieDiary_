//
//  ReviewWriteViewController.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/26.
//

import UIKit

class ReviewWriteViewController: UIViewController {
    
    let movieName = ""
    var eval = ""
    
    lazy var registerButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "등록", style: .plain, target: self, action: #selector(registerButtonPressed))
        return button
    }()
    
    let reviewWriteView: ReviewWriteView = {
        let view = ReviewWriteView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = movieName
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = registerButton
        
        addSubView()
        configure()
        
        reviewWriteView.rateButton.addTarget(self, action: #selector(reteButtonPressed), for: .touchUpInside)
    }
    
    @objc func reteButtonPressed() {
        let actionSheet = UIAlertController(title: "영화는 어땠나요?", message: nil, preferredStyle: .actionSheet)
        
        let bestMovie = UIAlertAction(title: "인생영화", style: .default) { [weak self] (action) in
            self?.reviewWriteView.rateButton.setTitle(action.title, for: .normal)
            self?.eval = action.title ?? ""
        }
        actionSheet.addAction(bestMovie)

        let goodMovie = UIAlertAction(title: "꿀잼영화", style: .default) { [weak self] (action) in
            self?.reviewWriteView.rateButton.setTitle(action.title, for: .normal)
            self?.eval = action.title ?? ""
        }
        actionSheet.addAction(goodMovie)
        
        let normalMovie = UIAlertAction(title: "보통영화", style: .default) { [weak self] (action) in
            self?.reviewWriteView.rateButton.setTitle(action.title, for: .normal)
            self?.eval = action.title ?? ""
        }
        actionSheet.addAction(normalMovie)
        
        let badMovie = UIAlertAction(title: "최악영화", style: .default) { [weak self] (action) in
            self?.reviewWriteView.rateButton.setTitle(action.title, for: .normal)
            self?.eval = action.title ?? ""
        }
        actionSheet.addAction(badMovie)

        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true, completion: nil)
    }
    
    @objc func registerButtonPressed() {
        //리뷰 등록
//        let metaData = try CoreDataManager.shared.createNewVideoMetaData(
//            name: name,
//            createdAt: Date(),
//            videoPath: path,
//            thumbnail: thumbnail,
//            videoLength: asset.duration.seconds)
//        try CoreDataManager.shared.insertVideoMetaData(metaData)
        
        let mataData = try CoreDataManger.shared.createNewReview(
            title: movieName,
            contents: <#T##String#>,
            movieInfo: <#T##String#>,
            eval: eval)
        try CoreDataManger.shared.insertReviewMataData(mataData)
    }

    func addSubView() {
        view.addSubview(reviewWriteView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            
            reviewWriteView.topAnchor.constraint(equalTo: view.topAnchor),
            reviewWriteView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewWriteView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reviewWriteView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
