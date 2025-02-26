//
//  Folder.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 26.02.2025.
//

import Foundation
import SwiftUI

struct Folder:Identifiable{
    let id : UUID = UUID()
    let nameOfFolder : String
    let wordsInFolder : [WordCard]
    let imageOfFolder : String
    let quantityOfWordsINFolder : Int
    let creationDate : Date = Date()
}
