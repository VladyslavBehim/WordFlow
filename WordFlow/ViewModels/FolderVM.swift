//
//  FolderVM.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 11.03.2025.
//

import Foundation
import SwiftUI

class FolderVM: ObservableObject{
    @Published var folders: [Folder] = []
    
    
    private let repository: FolderRepositoryProtocol
    
    
    init(repository: FolderRepositoryProtocol) {
        self.repository = repository
        loadFolders()
    }
    
    func loadFolders() {
        folders = repository.fetchFolders()
    }
    
    func createFolder(nameOfFolder : String , imageOfFolder : String) {
        let newFolder = Folder(nameOfFolder: nameOfFolder, wordsInFolder: [WordCard](), imageOfFolder: imageOfFolder)
        repository.addFolder(newFolder)
        loadFolders()
    }
    
    func addWord(to folderID: String, term: String, definition: String) {
        let newWord = WordCard(word: term, translation: definition, colorOfCard: Color.primary)
        repository.addWord(to: folderID, word: newWord)
        loadFolders()
    }
    
    func deleteFolder(_ folderID: String) {
        repository.deleteFolder(folderID)
        loadFolders()
    }
    
    func deleteWord(from folderID: String, wordID: String) {
        repository.deleteWord(from: folderID, wordID: wordID)
        loadFolders()
    }
    
    
    func changeStatusOfWordTrue(from folderID: String , wordId : String){
        repository.changeStatusOfWordTrue(from: folderID, wordId: wordId)
        loadFolders()
    }
    func changeStatusOfWordFalse(from folderID: String , wordId : String){
        repository.changeStatusOfWordFalse(from: folderID, wordId: wordId)
        loadFolders()

    }
    
    
    
}
