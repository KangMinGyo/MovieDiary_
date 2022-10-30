//
//  ReviewWriteViewController.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/26.
//

import UIKit

class ReviewWriteViewController: UIViewController {
    
    var movieName = ""
    var contents = ""
    var movieInfo = ""
    var eval = ""
    
    lazy var registerButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "등록",
                                     style: .plain,
                                     target: self,
                                     action: #selector(registerButtonPressed))
        button.tintColor = .red
        return button
    }()
    
    let reviewWriteView: ReviewWriteView = {
        let view = ReviewWriteView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = movieName
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = registerButton
        reviewWriteView.reviewTextView.delegate = self
        
        addSubView()
        configure()
        
        reviewWriteView.rateButton.addTarget(self, action: #selector(reteButtonPressed), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func reteButtonPressed() {
        let actionSheet = UIAlertController(title: "영화는 어땠나요?", message: nil, preferredStyle: .actionSheet)
        
        let bestMovie = UIAlertAction(title: "인생영화", style: .default) { [weak self] (action) in
            self?.reviewWriteView.rateButton.setTitle(action.title, for: .normal)
            self?.eval = action.title ?? ""
        }
        actionSheet.addAction(bestMovie)

        let goodMovie = UIAlertAction(title: "꿀잼영화", style: .default) { [weak self] (action) in
            self?.reviewWriteView.rateButton.setTitle(action.title, for: .normal)
            self?.eval = action.title ?? ""
        }
        actionSheet.addAction(goodMovie)
        
        let normalMovie = UIAlertAction(title: "보통영화", style: .default) { [weak self] (action) in
            self?.reviewWriteView.rateButton.setTitle(action.title, for: .normal)
            self?.eval = action.title ?? ""
        }
        actionSheet.addAction(normalMovie)
        
        let badMovie = UIAlertAction(title: "최악영화", style: .default) { [weak self] (action) in
            self?.reviewWriteView.rateButton.setTitle(action.title, for: .normal)
            self?.eval = action.title ?? ""
        }
        actionSheet.addAction(badMovie)

        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true, completion: nil)
    }
    
    @objc func registerButtonPressed() {
        contents = reviewWriteView.reviewTextView.text
        
        if contents.isEmpty || contents == "내용을 입력해주세요." {
            let alert = UIAlertController(title: "잠깐!", message: "나의 리뷰를 입력해주세요", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if eval == "" {
            let alert = UIAlertController(title: "잠깐!", message: "영화 평가를 해주세요", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        } else {
            //리뷰 등록
            ReviewManager.shared.saveReview(title: movieName, contents: contents, movieInfo: movieInfo, eval: eval) { result in
                switch result {
                case .success(let mataData):
                    print(mataData)
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            }
            self.navigationController?.popToRootViewController(animated: true)
        }
    }

    func addSubView() {
        view.addSubview(reviewWriteView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            
            reviewWriteView.topAnchor.constraint(equalTo: view.topAnchor),
            reviewWriteView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewWriteView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reviewWriteView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ReviewWriteViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if reviewWriteView.reviewTextView.textColor == UIColor.lightGray {
            reviewWriteView.reviewTextView.text = ""
            reviewWriteView.reviewTextView.textColor = UIColor.black
            }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if reviewWriteView.reviewTextView.text.isEmpty {
            reviewWriteView.reviewTextView.text = "내용을 입력해주세요."
            reviewWriteView.reviewTextView.textColor = UIColor.lightGray
            }
    }
}
