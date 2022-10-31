//
//  Date+Extension.swift
//  MovieDiary
//
//  Created by KangMingyo on 2022/10/31.
//

import Foundation

extension Date {
    func reviewDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.string(from: self)
    }
    
    //어제 날짜 구하기
    func yesterdayDate() -> String {
        let now = Date()
        let yesterday = now.addingTimeInterval(3600 * -24)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        let yesterdayData = formatter.string(from: yesterday)
        return yesterdayData
    }

}
