//
//  SettingView.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/30.
//

import UIKit

class SettingView: UIView {
    
    let topLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let askButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle(I18NString.mail.feedback, for: .normal)
        button.contentHorizontalAlignment = .leading
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.tintColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttomLineView: UIView = {
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(topLineView)
        addSubview(askButton)
        addSubview(buttomLineView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            topLineView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topLineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topLineView.heightAnchor.constraint(equalToConstant: 1),
            
            askButton.topAnchor.constraint(equalTo: topLineView.bottomAnchor, constant: 10),
            askButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            askButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            buttomLineView.topAnchor.constraint(equalTo: askButton.bottomAnchor, constant: 10),
            buttomLineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttomLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttomLineView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}

