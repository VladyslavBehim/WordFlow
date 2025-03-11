//
//  WordsViewModel.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 04.03.2025.
//

import Foundation

 class WordsViewModel : ObservableObject{
     @Published var folder: Folder
    
    init(folder: Folder) {
        self.folder = folder
    }
    
    func addNewWord(_ wordCard: WordCard) {
        folder.wordsInFolder.append(wordCard)
    }
    
    func removeWord(wordId: String) {
        if let index = folder.wordsInFolder.firstIndex(where: { $0.id == wordId }) {
            folder.wordsInFolder.remove(at: index)
        }
    }
    
}

