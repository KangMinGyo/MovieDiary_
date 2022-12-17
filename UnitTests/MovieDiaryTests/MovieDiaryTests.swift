//
//  MovieDiaryTests.swift
//  MovieDiaryTests
//
//  Created by KangMingyo on 2022/10/24.
//

import XCTest
@testable import MovieDiary

final class MovieDiaryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test저장_불러오기_삭제() throws {
        //MARK: 저장
        
        let url = ReviewManager.shared.
        
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

//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
