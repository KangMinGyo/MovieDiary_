//
//  MovieDiaryTests.swift
//  MovieDiaryTests
//
//  Created by KangMingyo on 2022/10/24.
//

import XCTest
@testable import MovieDiary

final class ReviewManagerTest: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func test저장_불러오기_삭제() throws {
        //MARK: 저장
        
        //1. given
        let title = "TestMovieName"
        let contents = "너무 재미있어요."
        let movieInfo = "미국 | 액션"
        let eval = "꿀잼영화"
        
        //2. when
        var resultMataData: ReviewMetaData?
        ReviewManager.shared.saveReview(title: title, contents: contents, movieInfo: movieInfo, eval: eval) { result in
            switch result {
            case .success(let metaData):
                resultMataData = metaData
//                print(resultMataData)
            case .failure(let error):
                debugPrint(error.localizedDescription)
                XCTFail("Failed")
            }
        }
        
        //3. then
        XCTAssertEqual(resultMataData?.title, "TestMovieName")
        XCTAssertEqual(resultMataData?.contents, "너무 재미있어요.")
        
    }

}
