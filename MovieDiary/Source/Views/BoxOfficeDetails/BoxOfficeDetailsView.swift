//
//  BoxOfficeDetailsView.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/24.
//


import UIKit

class BoxOfficeDetailsView: UIView {
    
    let backdropImageView: UIImageView = {
         let imageView = UIImageView()
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
     }()
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
     }()

    let movieName: UILabel = {
        let label = UILabel()
        label.shadow()
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieNameEn: UILabel = {
        let label = UILabel()
        label.shadow()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genresAndShowTime: UILabel = {
        let label = UILabel()
        label.shadow()
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let openDate: UILabel = {
        let label = UILabel()
        label.shadow()
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let movieInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let boxOfficeRank: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let boxOfficeLabel: UILabel = {
        let label = UILabel()
        label.text = "박스오피스"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let boxOfficeRankStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let audiAcc: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let audiAccLabel: UILabel = {
        let label = UILabel()
        label.text = "누적관객수"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let audiAccStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let rankInten: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rankIntenLabel: UILabel = {
        let label = UILabel()
        label.text = "전일 대비"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rankIntenStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let movieInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        [movieName, movieNameEn, genresAndShowTime, openDate].forEach {
            self.movieStackView.addArrangedSubview($0)
        }
        
        [boxOfficeRank, boxOfficeLabel].forEach {
            self.boxOfficeRankStackView.addArrangedSubview($0)
        }
        
        [audiAcc, audiAccLabel].forEach {
            self.audiAccStackView.addArrangedSubview($0)
        }
        
        [rankInten, rankIntenLabel].forEach {
            self.rankIntenStackView.addArrangedSubview($0)
        }
        
        [boxOfficeRankStackView, rankIntenStackView, audiAccStackView].forEach {
            self.movieInfoStackView.addArrangedSubview($0)
        }
        
        addView()
        configure()
    }

    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addView() {
        addSubview(backdropImageView)
        addSubview(posterImageView)
        addSubview(movieStackView)
        
        addSubview(movieInfoView)
        movieInfoView.addSubview(movieInfoStackView)
        addSubview(lineView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            
            backdropImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backdropImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backdropImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backdropImageView.heightAnchor.constraint(equalToConstant: 300),
        
            posterImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            posterImageView.bottomAnchor.constraint(equalTo: backdropImageView.bottomAnchor, constant: -20),
            posterImageView.heightAnchor.constraint(equalToConstant: 130),
            posterImageView.widthAnchor.constraint(equalToConstant: 90),

            movieStackView.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            movieStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            movieStackView.bottomAnchor.constraint(equalTo: backdropImageView.bottomAnchor, constant: -20),

            movieInfoView.topAnchor.constraint(equalTo: backdropImageView.bottomAnchor),
            movieInfoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            movieInfoView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            movieInfoView.heightAnchor.constraint(equalToConstant: 100),
            
            movieInfoStackView.centerXAnchor.constraint(equalTo: movieInfoView.centerXAnchor),
            movieInfoStackView.centerYAnchor.constraint(equalTo: movieInfoView.centerYAnchor),
            
            lineView.topAnchor.constraint(equalTo: movieInfoView.bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}

extension UILabel {
    func shadow() {
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 5
        layer.shadowColor = UIColor.darkGray.cgColor
        
    }
}
