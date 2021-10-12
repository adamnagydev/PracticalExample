//
//  DateFormatters.swift
//  PracticalExample
//
//  Created by Adam Nagy on 2021. 10. 12..
//

import Foundation

extension DateFormatter {

    static let mmmDyyyy: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()
}
