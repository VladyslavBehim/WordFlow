//
//  FolderList.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 26.02.2025.
//

import SwiftUI

struct FolderList: View {
    @State var isShownAddingView : Bool = false
    @State var folders : [Folder] = [Folder(nameOfFolder: "Lesson 2", wordsInFolder: [WordCard(word: "simultaneously", translation: "одновременно", colorOfCard: Color.blue)], imageOfFolder: "🤯", quantityOfWordsINFolder: 231),Folder(nameOfFolder: "Lesson 3", wordsInFolder: [WordCard(word: "do you know", translation: "ты знаешь?", colorOfCard: Color.primary)], imageOfFolder: "🥵", quantityOfWordsINFolder: 54),Folder(nameOfFolder: "Lesson 4", wordsInFolder: [WordCard(word: "Hello", translation: "Приветики", colorOfCard: Color.primary), WordCard(word: "Diversity", translation: "Разнообразие", colorOfCard: Color.primary), WordCard(word: "Obviosly", translation: "Очевидно", colorOfCard: Color.primary)], imageOfFolder: "🥴", quantityOfWordsINFolder: 164)]
    
    var body: some View {
        NavigationView {
            List{
                Section {
                    ForEach(folders){ folder in
                        NavigationLink {
                            WordList(words: folder.wordsInFolder, dateOfCreation: folder.creationDate, nameOfFolder: folder.nameOfFolder)
                        } label: {
                            ForderRow(folder: folder)
                        }
                    }
                    
                } header: {
                    HStack{
                        Text("Folders")
                        Spacer()
                        Button {
                            withAnimation(.default) {
                                isShownAddingView = true
                            }
                        } label: {
                            Text("Add new folder")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.white)
                                .padding(.vertical , 7)
                                .padding(.horizontal)
                                .background(Color.accentColor)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                    }
                }

                
            }
            .navigationTitle("Library")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isShownAddingView) {
                AddingNewFolder(isShownTextField: $isShownAddingView, folders: $folders)
                    .presentationDetents([.height(200)])
                    .presentationCornerRadius(30)
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    
    FolderList()
}
