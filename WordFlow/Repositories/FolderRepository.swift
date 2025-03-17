//
//  FolderRepository.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 11.03.2025.
//

import Foundation
import SwiftUICore

protocol FolderRepositoryProtocol {
    func fetchFolders() -> [Folder]
    func addFolder(_ folder: Folder)
    func deleteFolder(_ folderID: String)
    func addWord(to folderID: String, word: WordCard)
    func deleteWord(from folderID: String, wordID: String)
    func changeStatusOfWordTrue(from folderID: String , wordId : String)
    func changeStatusOfWordFalse(from folderID: String , wordId : String)
}

class FolderRepository : FolderRepositoryProtocol {
    private var folders: [Folder] = [Folder(nameOfFolder: "Test", wordsInFolder: [WordCard(word: "test", translation: "Тест")], imageOfFolder: "🥹")]
    
    
    func fetchFolders() -> [Folder] {
        return self.folders
    }
    
    func addFolder(_ folder: Folder) {
        folders.append(folder)
    }
    
    func deleteFolder(_ folderID: String) {
        folders.removeAll { $0.id == folderID }
    }
    
    func addWord(to folderID: String, word: WordCard) {
        if let index = folders.firstIndex(where: { $0.id == folderID }) {
            folders[index].wordsInFolder.append(word)
        }
    }
    
    func deleteWord(from folderID: String, wordID: String) {
        if let index = folders.firstIndex(where: { $0.id == folderID }) {
            folders[index].wordsInFolder.removeAll { $0.id == wordID }
        }
    }
    
    func changeStatusOfWordTrue(from folderID: String , wordId : String){
        if let folderIndex = folders.firstIndex(where: { $0.id == folderID }) {
            if let wordIndex = folders[folderIndex].wordsInFolder.firstIndex(where: {$0.id == wordId}){
                folders[folderIndex].wordsInFolder[wordIndex].learned = true
            }
        }

    }
    
    func changeStatusOfWordFalse(from folderID: String , wordId : String){
        if let folderIndex = folders.firstIndex(where: { $0.id == folderID }) {
            if let wordIndex = folders[folderIndex].wordsInFolder.firstIndex(where: {$0.id == wordId}){
                folders[folderIndex].wordsInFolder[wordIndex].learned = false
            }
        }

    }
    
    
}
