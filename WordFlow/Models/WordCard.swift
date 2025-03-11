//
//  File.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 25.02.2025.
//

import Foundation
import SwiftUI

struct WordCard : Identifiable , Equatable{
    let id: String = UUID().uuidString
    let word: String
    let translation: String
    let colorOfCard: Color
    var learned: Bool = false
}
