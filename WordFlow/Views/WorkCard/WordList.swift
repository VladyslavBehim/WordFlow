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
    var learnedWords : Int{
        folder.wordsInFolder.filter { $0.learned }.count
    }
    @ObservedObject var viewModel: FolderVM
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
                Section{
                    HStack{
                        Text("Learned")
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text("\(learnedWords) | \(folder.wordsInFolder.count)")
                            .fontWeight(.semibold)
                    }
                }
                Section {
                    ForEach(folder.wordsInFolder.reversed()){ word in
                       
                        HStack{
                            if word.learned{
                                Image(systemName: "graduationcap.fill")
                            }
                            WordCardRow(wordCard: word)
                            Button {
                                viewModel.deleteWord(from: folder.id, wordID: word.id)

                            } label: {
                                Image(systemName: "trash.fill")

                            }
                            .buttonStyle(.borderless)

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
                AddingNewCard(isShownTextField: $isShownTextField, folder: folder, viewModel: viewModel)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
                    .presentationDragIndicator(.visible)
            }
            .fullScreenCover(isPresented: $isShownFleshCardsView) {
                FlashcardView(wordCards: folder.wordsInFolder, folder: $folder, viewModel: viewModel)
            }
            
        }
        
        .navigationTitle("\(folder.nameOfFolder)")
    }
}

//#Preview {
//    WordList(folder: .constant(Folder(nameOfFolder: "Test", wordsInFolder: [WordCard(word: "test", translation: "Тест", colorOfCard: Color.pink)], imageOfFolder: "")))
//}
