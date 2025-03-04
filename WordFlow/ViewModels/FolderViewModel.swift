//
//  FolderViewModel.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 04.03.2025.
//

import Foundation
import SwiftUI


class FolderViewModel : ObservableObject {
    @Published var folders : [Folder] = [Folder( nameOfFolder: "Lesson 2", wordsInFolder: [WordCard(word: "simultaneously", translation: "одновременно", colorOfCard: Color.blue)], imageOfFolder: "🤯"),Folder( nameOfFolder: "Lesson 3", wordsInFolder: [WordCard(word: "do you know", translation: "ты знаешь?", colorOfCard: Color.primary)], imageOfFolder: "🥵"),Folder( nameOfFolder: "Lesson 4", wordsInFolder: [WordCard(word: "Hello", translation: "Приветики", colorOfCard: Color.primary), WordCard(word: "Diversity", translation: "Разнообразие", colorOfCard: Color.primary), WordCard(word: "Obviosly", translation: "Очевидно", colorOfCard: Color.primary),WordCard(word: "current", translation: "текущий", colorOfCard: Color.primary),WordCard(word: "man", translation: "мужчина", colorOfCard: Color.primary),WordCard(word: "girl", translation: "девушка", colorOfCard: Color.primary),WordCard(word: "wave", translation: "волна", colorOfCard: Color.primary),WordCard(word: "striky", translation: "строгий", colorOfCard: Color.primary)], imageOfFolder: "🥴")]
    
    func addNewWord(wordCard: WordCard , folderId : String){
        if let index = folders.firstIndex(where: { $0.id == folderId }) {
            folders[index].wordsInFolder.append(wordCard)
        }
    }
    
    func removeWord(folderId: String , wordId : String){
        if let folderIndex = folders.firstIndex(where: { $0.id == folderId }) {
            if let wordIndex = folders[folderIndex].wordsInFolder.firstIndex(where: {$0.id == wordId}){
                folders[folderIndex].wordsInFolder.remove(at: wordIndex)
            }
        }

    }
}
