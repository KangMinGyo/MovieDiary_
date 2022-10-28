//
//  MovieReviewDetailView.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/28.
//

import UIKit

class MovieReviewDetailView: UIView {
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 리뷰"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let reviewTextView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let evalLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 평가"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let evalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addView()
        configure()
    }
    
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(reviewLabel)
        addSubview(reviewTextView)
        addSubview(evalLabel)
        addSubview(evalImageView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            reviewLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            reviewLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            reviewTextView.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 20),
            reviewTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            evalLabel.topAnchor.constraint(equalTo: reviewTextView.bottomAnchor, constant: 20),
            evalLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            evalImageView.topAnchor.constraint(equalTo: evalLabel.topAnchor, constant: 20),
            evalImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
}
