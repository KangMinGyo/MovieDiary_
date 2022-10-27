//
//  ReviewWriteView.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/26.
//

import UIKit

class ReviewWriteView: UIView {
    
    let rateButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.backgroundColor = .systemBackground
        button.setTitle("이 영화에 대해 평가해주세요.", for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let reviewTextView: UITextView = {
        let textView = UITextView()
        textView.text = "리뷰를 입력해주세요"
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        configure()
    }
    
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(rateButton)
        addSubview(reviewTextView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            
            rateButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            rateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            rateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            reviewTextView.topAnchor.constraint(equalTo: rateButton.bottomAnchor),
            reviewTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            reviewTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            reviewTextView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}

