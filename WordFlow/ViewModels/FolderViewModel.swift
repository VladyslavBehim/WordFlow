////
////  FolderViewModel.swift
////  WordFlow
////
////  Created by Vladyslav Behim on 04.03.2025.
////
//
//import Foundation
//import SwiftUI
//
//
//class FolderViewModel : ObservableObject {
//    @Published var folders : [Folder] = [/*Folder( nameOfFolder: "Lesson 2", wordsInFolder: [WordCard(word: "simultaneously", translation: "одновременно", colorOfCard: Color.blue)], imageOfFolder: "🤯"),Folder( nameOfFolder: "Lesson 3", wordsInFolder: [WordCard(word: "do you know", translation: "ты знаешь?", colorOfCard: Color.primary)], imageOfFolder: "🥵"),Folder( nameOfFolder: "Lesson 4", wordsInFolder: [WordCard(word: "Relish", translation: "Смаковать", colorOfCard: Color.primary),WordCard(word: "Assess the situation", translation: "Оценить ситуацию", colorOfCard: Color.primary),WordCard(word: "Dedicate", translation: "Посвящать", colorOfCard: Color.primary),WordCard(word: "The best skill you need to hone", translation: "Лучший навык который вам нужно отточить", colorOfCard: Color.primary),WordCard(word: "Imposter syndrome", translation: "Синдром самозванца", colorOfCard: Color.primary),WordCard(word: "Underestimate", translation: "Недооценивать", colorOfCard: Color.primary),WordCard(word: "Purportedly", translation: "якобы", colorOfCard: Color.primary),WordCard(word: "Hammer a nail", translation: "Забить гвоздь", colorOfCard: Color.primary),WordCard(word: "urge you", translation: "призываю вас", colorOfCard: Color.primary),WordCard(word: "invariable", translation: "Неизменный", colorOfCard: Color.primary),WordCard(word: "Perceive", translation: "Воспринимать", colorOfCard: Color.primary),WordCard(word: "Slump", translation: "Спад", colorOfCard: Color.primary)], imageOfFolder: "🥴")*/]
//    
//    
//    func addNewWord(wordCard: WordCard , folderId : String){
//        if let index = folders.firstIndex(where: { $0.id == folderId }) {
//            folders[index].wordsInFolder.append(wordCard)
//        }
//    }
//    
//    func removeWord(folderId: String , wordId : String){
//        if let folderIndex = folders.firstIndex(where: { $0.id == folderId }) {
//            if let wordIndex = folders[folderIndex].wordsInFolder.firstIndex(where: {$0.id == wordId}){
//                folders[folderIndex].wordsInFolder.remove(at: wordIndex)
//            }
//        }
//
//    }
//    
//    func changeStatusOfWordTrue(folderId: String , wordId : String){
//        if let folderIndex = folders.firstIndex(where: { $0.id == folderId }) {
//            if let wordIndex = folders[folderIndex].wordsInFolder.firstIndex(where: {$0.id == wordId}){
//                folders[folderIndex].wordsInFolder[wordIndex].learned = true
//            }
//        }
//
//    }
//    func changeStatusOfWordFalse(folderId: String , wordId : String){
//        if let folderIndex = folders.firstIndex(where: { $0.id == folderId }) {
//            if let wordIndex = folders[folderIndex].wordsInFolder.firstIndex(where: {$0.id == wordId}){
//                folders[folderIndex].wordsInFolder[wordIndex].learned = false
//            }
//        }
//
//    }
//}
