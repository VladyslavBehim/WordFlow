//
//  CDWordListView.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 16.03.2025.
//

import SwiftUI

struct CDWordListView: View {
    let dateFormatter = DateFormatters()
    @State var isShownTextField : Bool = false
    @State var isShownFleshCardsView : Bool = false
    let folder : CDFolder?
    @FetchRequest(fetchRequest: CDWordCard.fetch()) var tasks
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) var dismiss
    
    init(folder: CDFolder?,   viewModel: FolderVM, pluralize: Pluralize = Pluralize()) {
        self.folder = folder
        self.viewModel = viewModel
        self.pluralize = pluralize
        
        let request = CDWordCard.fetch()
        request.predicate = NSPredicate(format: "folder == %@", folder! as CVarArg)
        self._tasks = FetchRequest(fetchRequest: request)
    }

//    @Binding var folder : CDFolder
//    var learnedWords : Int{
//        folder.wordsInFolder.filter { $0.learned }.count
//    }
//    var stillLearinigWords : Int{
//        folder.wordsInFolder.filter { !$0.learned }.count
//    }
    @State var stillLearinigWordsArray:[WordCard] = []
    @ObservedObject var viewModel: FolderVM
    var pluralize = Pluralize()
    
    var body: some View {
        VStack(spacing:0){
            List{
                Button {
                    let word = CDWordCard(word: "Test", translation: "Тест", context: context)
                    word.folder = folder
                    PersistenceController.shared.save()
                } label: {
                    Text("Create a new word")
                }

                Section{
//                    NavigationLink {
//                        FlashcardView(folder: $folder, viewModel: viewModel, stillLearinigWordsArray: $stillLearinigWordsArray)
//                    } label: {
//                        Label {
//                            Text("Flashcards")
//                        } icon: {
//                            Image(systemName: "inset.filled.rectangle.on.rectangle")
//                        }
//                    }

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
                       
                    }
                }
                Section {
                    ForEach(tasks.reversed()){ word in
                        
                        HStack{
                            if word.learned{
                                Image(systemName: "graduationcap.fill")
                            }
                            WordCardRow(wordCard: word)
//                            Text(word.word)
                            Button {
//                                viewModel.deleteWord(from: folder.id, wordID: word.id)
                                
                            } label: {
                                Image(systemName: "trash.fill")
                                
                            }
                            .buttonStyle(.borderless)
                            
                        }
                        
                        
                    }
                    
                } header: {
                    HStack{
                        if !tasks.isEmpty{
                            VStack(alignment:.leading){
                                Text("Words")
//                                Text("\(dateFormatter.formatDateDayMounthYear(tasks.creationDate))")
                            }
                            .fontWeight(.semibold)
                        }
                        
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
                        if tasks.isEmpty{
                            Spacer()

                        }
                    }
                }
            }
            
            .sheet(isPresented: $isShownTextField) {
                AddingNewCard(isShownTextField: $isShownTextField, folder: folder)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
                    .presentationDragIndicator(.visible)
            }
            .fullScreenCover(isPresented: $isShownFleshCardsView) {
                FlashcardView(folder: $folder, viewModel: viewModel, stillLearinigWordsArray: $stillLearinigWordsArray)
            }
            
        }
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    if let folder = folder {
                        CDFolder.delete(folder: folder )
                        dismiss()
                    }
                } label: {
                    Image(systemName: "trash")
                }

            }
        }
        .navigationTitle("\(folder!.nameOfFolder)")
        
    }
}
