//
//  FolderList.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 26.02.2025.
//

import SwiftUI

struct FolderList: View {
    @State var folders : [Folder] = [Folder(nameOfFolder: "Lesson 2", wordsInFolder: [WordCard(word: "Hello", translation: "Привет")], imageOfFolder: "🤯", quantityOfWordsINFolder: 231),Folder(nameOfFolder: "Lesson 3", wordsInFolder: [WordCard(word: "do you know", translation: "ты знаешь?")], imageOfFolder: "🥵", quantityOfWordsINFolder: 54),Folder(nameOfFolder: "Lesson 4", wordsInFolder: [WordCard(word: "Hello", translation: "Приветики"), WordCard(word: "Diversity", translation: "Разнообразие"), WordCard(word: "Obviosly", translation: "Очевидно")], imageOfFolder: "🥴", quantityOfWordsINFolder: 164)]
    var body: some View {
        NavigationView {
            List(folders){ folder in
                NavigationLink {
                    WordList(words: folder.wordsInFolder, dateOfCreation: folder.creationDate, nameOfFolder: folder.nameOfFolder)
                } label: {
                    ForderRow(folder: folder)
                }
            }
            .navigationTitle("Library")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

#Preview {
    FolderList(folders: [Folder(nameOfFolder: "Lesson 2", wordsInFolder: [WordCard(word: "Hello", translation: "Привет")], imageOfFolder: "🤯", quantityOfWordsINFolder: 231),Folder(nameOfFolder: "Lesson 3", wordsInFolder: [WordCard(word: "do you know", translation: "ты знаешь?")], imageOfFolder: "🥵", quantityOfWordsINFolder: 54),Folder(nameOfFolder: "Lesson 4", wordsInFolder: [WordCard(word: "Hello", translation: "Приветики"), WordCard(word: "Diversity", translation: "Разнообразие"), WordCard(word: "Obviosly", translation: "Очевидно")], imageOfFolder: "🥴", quantityOfWordsINFolder: 164)])
}
