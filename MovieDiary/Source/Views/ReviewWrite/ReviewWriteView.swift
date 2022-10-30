//
//  ReviewWriteView.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/26.
//

import UIKit

class ReviewWriteView: UIView {
    
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
    
    let rateLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 평가"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rateButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.backgroundColor = .systemBackground
        button.setTitle("이 영화에 대해 평가를 선택해주세요. ", for: UIControl.State.normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(reviewLabel)
        addSubview(reviewTextView)
        addSubview(rateLabel)
        addSubview(rateButton)
        addSubview(lineView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            
            reviewLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            reviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            reviewTextView.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 5),
            reviewTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            reviewTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            reviewTextView.heightAnchor.constraint(equalToConstant: 200),
            
            rateLabel.topAnchor.constraint(equalTo: reviewTextView.bottomAnchor, constant: 20),
            rateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            rateButton.topAnchor.constraint(equalTo: rateLabel.bottomAnchor, constant: 5),
            rateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            rateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            lineView.topAnchor.constraint(equalTo: rateButton.bottomAnchor, constant: 20),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

