//
//  DateExtensions.swift
//  Fitness
//
//  Created by 하진호 on 2022/03/14.
//

import Foundation

extension Date {
    var yearMonthDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        return formatter.string(from: self)
    }
    
    func formatted(as format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func isSameDay(as day: Date) -> Bool {
        return self.yearMonthDay == day.yearMonthDay
    }
    
    func lastSevenDays() -> [Date] {
        (-6...0).map {
            Calendar.current.date(byAdding: .day, value: $0, to: Date()) ?? Date()
        }
    }
}
