//
//  DateFormatter.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 26.02.2025.
//

import Foundation

class DateFormatters{
    func formatDateDayMounthYear(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: date)
    }
}
