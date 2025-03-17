//
//  NSPredicate+helper.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 16.03.2025.
//

import Foundation

extension NSPredicate{
    static let all = NSPredicate(format: "TRUEPREDICATE")
    static let none = NSPredicate(format: "FALSEPREDICATE")
}
