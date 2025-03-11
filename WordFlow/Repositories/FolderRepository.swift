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
    private var folders: [Folder] = [Folder( nameOfFolder: "Lesson 2", wordsInFolder: [WordCard(word: "simultaneously", translation: "одновременно", colorOfCard: Color.blue)], imageOfFolder: "🤯"),Folder( nameOfFolder: "Lesson 3", wordsInFolder: [WordCard(word: "do you know", translation: "ты знаешь?", colorOfCard: Color.primary)], imageOfFolder: "🥵"),Folder( nameOfFolder: "Lesson 4", wordsInFolder: [WordCard(word: "Relish", translation: "Смаковать", colorOfCard: Color.primary),WordCard(word: "Assess the situation", translation: "Оценить ситуацию", colorOfCard: Color.primary),WordCard(word: "Dedicate", translation: "Посвящать", colorOfCard: Color.primary),WordCard(word: "The best skill you need to hone", translation: "Лучший навык который вам нужно отточить", colorOfCard: Color.primary),WordCard(word: "Imposter syndrome", translation: "Синдром самозванца", colorOfCard: Color.primary),WordCard(word: "Underestimate", translation: "Недооценивать", colorOfCard: Color.primary),WordCard(word: "Purportedly", translation: "якобы", colorOfCard: Color.primary),WordCard(word: "Hammer a nail", translation: "Забить гвоздь", colorOfCard: Color.primary),WordCard(word: "urge you", translation: "призываю вас", colorOfCard: Color.primary),WordCard(word: "invariable", translation: "Неизменный", colorOfCard: Color.primary),WordCard(word: "Perceive", translation: "Воспринимать", colorOfCard: Color.primary),WordCard(word: "Slump", translation: "Спад", colorOfCard: Color.primary)], imageOfFolder: "🥴")]
    
    
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
