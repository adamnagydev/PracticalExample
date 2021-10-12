//
//  String+Extensions.swift
//  PracticalExample
//
//  Created by Adam Nagy on 2021. 10. 12..
//

import Foundation

extension String {
    var orNilIfEmpty: String? {
        isEmpty ? nil : self
    }
}
