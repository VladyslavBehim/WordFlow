//
//  File.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 25.02.2025.
//

import Foundation
import SwiftUI

struct WordCard : Identifiable{
    let id = UUID()
    let word: String
    let translation: String
    let colorOfCard: Color
}
