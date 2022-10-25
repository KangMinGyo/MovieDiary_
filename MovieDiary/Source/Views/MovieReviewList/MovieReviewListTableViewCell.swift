//
//  MovieReviewListTableViewCell.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/24.
//

import UIKit

class MovieReviewListTableViewCell: UITableViewCell {
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.text = "movieName"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let movieInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "한국|2021"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let recordDateLabel: UILabel = {
        let label = UILabel()
        label.text = "2022.10.24"
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
        addSubview(movieInfoLabel)
        addSubview(recordDateLabel)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            movieNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            movieNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            movieInfoLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 5),
            movieInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            recordDateLabel.topAnchor.constraint(equalTo: movieInfoLabel.bottomAnchor, constant: 5),
            recordDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
}
