//
//  SettingViewController.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/30.
//

import UIKit
import MessageUI

class SettingViewController: UIViewController {
    
    let settingView: SettingView = {
        let view = SettingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addSubView()
        configure()
        
        settingView.askButton.addTarget(self, action: #selector(askButtonPressed), for: .touchUpInside)
    }
    
    @objc func askButtonPressed() {
        sendMail()
    }
    
    func addSubView() {
        view.addSubview(settingView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            settingView.topAnchor.constraint(equalTo: view.topAnchor),
            settingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

