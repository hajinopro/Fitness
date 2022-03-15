//
//  DateExtensions.swift
//  Fitness
//
//  Created by 하진호 on 2022/03/14.
//

import Foundation

extension Date {
    func formatted(as format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
