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
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 리뷰"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let reviewTextView: UITextView = {
        let textView = UITextView()
        textView.text = "내용을 입력해주세요."
        textView.textColor = .lightGray
        textView.backgroundColor = .systemGray6
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
        addSubview(reviewLabel)
        addSubview(reviewTextView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            
            rateButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            rateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            rateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            reviewLabel.topAnchor.constraint(equalTo: rateButton.bottomAnchor, constant: 20),
            reviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            reviewTextView.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 5),
            reviewTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            reviewTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            reviewTextView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

