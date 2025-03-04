//
//  Folder.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 26.02.2025.
//

import Foundation
import SwiftUI

struct Folder:Identifiable {
    let id: String = UUID().uuidString
    var nameOfFolder : String
    var wordsInFolder : [WordCard]
    var imageOfFolder : String
    var quantityOfWordsInFolder : Int {
        self.wordsInFolder.count
    }
    let creationDate : Date = Date()
}

