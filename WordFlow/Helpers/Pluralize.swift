//
//  Pluralize.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 12.03.2025.
//

import Foundation

class Pluralize{
    func pluralize(_ count: Int, _ forms: (String, String, String)) -> String {
        let remainder100 = count % 100
        let remainder10 = count % 10

        if remainder100 >= 11 && remainder100 <= 19 {
            return forms.2  // слов
        } else if remainder10 == 1 {
            return forms.0  // слово
        } else if remainder10 >= 2 && remainder10 <= 4 {
            return forms.1  // слова
        } else {
            return forms.2  // слов
        }
    }
}
