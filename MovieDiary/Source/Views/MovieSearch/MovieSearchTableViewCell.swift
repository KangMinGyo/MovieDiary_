//
//  MovieSearchTableViewCell.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/25.
//

import UIKit

class MovieSearchTableViewCell: UITableViewCell {
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.text = "영화이름"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieNameEnLabel: UILabel = {
        let label = UILabel()
        label.text = "movieName"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let movieInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "한국|액션|2021"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let directorLabel: UILabel = {
        let label = UILabel()
        label.text = "개굴쓰"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addView()
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(movieNameLabel)
        addSubview(movieNameEnLabel)
        addSubview(movieInfoLabel)
        addSubview(directorLabel)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            movieNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            movieNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            movieNameEnLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 5),
            movieNameEnLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            movieInfoLabel.topAnchor.constraint(equalTo: movieNameEnLabel.bottomAnchor, constant: 5),
            movieInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            directorLabel.topAnchor.constraint(equalTo: movieInfoLabel.bottomAnchor, constant: 5),
            directorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }
}
