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
        label.text = I18NString.SubTitle.myReview
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let reviewTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .systemGray6
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let reviewView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let evalLabel: UILabel = {
        let label = UILabel()
        label.text = I18NString.SubTitle.myRate
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
        
        backgroundColor = .systemBackground
        
        addView()
        configure()
    }
    
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(reviewLabel)
        addSubview(reviewTextView)
        addSubview(reviewView)
        addSubview(evalLabel)
        addSubview(evalImageView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            reviewLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            reviewLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            reviewView.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 5),
            reviewView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            reviewView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            reviewView.heightAnchor.constraint(equalToConstant: 200),
            
            reviewTextView.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 5),
            reviewTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            reviewTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            reviewTextView.heightAnchor.constraint(equalToConstant: 200),
            
            evalLabel.topAnchor.constraint(equalTo: reviewTextView.bottomAnchor, constant: 20),
            evalLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            evalImageView.topAnchor.constraint(equalTo: evalLabel.topAnchor, constant: 20),
            evalImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
}

