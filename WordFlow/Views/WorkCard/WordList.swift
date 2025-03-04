//
//  WordList.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 25.02.2025.
//

import SwiftUI

struct WordList: View {
    
    let dateFormatter = DateFormatters()
    
    @State var isShownTextField : Bool = false
    @State var isShownFleshCardsView : Bool = false
    @Binding var folder : Folder
    
    
    @EnvironmentObject var folderViewModel:FolderViewModel

    var body: some View {
        VStack(spacing:0){
            List{
                Section{
                    Button {
                        isShownFleshCardsView.toggle()
                    } label: {
                        Label {
                            Text("Flashcards")
                        } icon: {
                            Image(systemName: "inset.filled.rectangle.on.rectangle")
                        }

                    }
                }
                Section {
                    ForEach(folder.wordsInFolder.reversed()){ word in
                        HStack{
                            WordCardRow(wordCard: word)
                            Button {
                                folderViewModel.removeWord(folderId: folder.id, wordId: word.id)

                            } label: {
                                Image(systemName: "trash.fill")

                            }
                        }
                        

                    }
                } header: {
                    HStack{
                        VStack(alignment:.leading){
                            Text("Words")
                            Text("\(dateFormatter.formatDateDayMounthYear(folder.creationDate))")
                        }
                        .fontWeight(.semibold)
                        Spacer()
                        Button {
                            withAnimation(.default) {
                                isShownTextField = true
                            }
                        } label: {
                            Text("Add new word")
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
            
            .sheet(isPresented: $isShownTextField) {
                AddingNewCard(isShownTextField: $isShownTextField, folder: $folder)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
                    .presentationDragIndicator(.visible)
            }
            .fullScreenCover(isPresented: $isShownFleshCardsView) {
                FlashcardView(wordCards: folder.wordsInFolder)
            }
            
        }
        
        .navigationTitle("\(folder.nameOfFolder)")
    }
}

#Preview {
    WordList(folder: .constant(Folder(nameOfFolder: "Test", wordsInFolder: [WordCard(word: "test", translation: "Тест", colorOfCard: Color.pink)], imageOfFolder: "")))
}
