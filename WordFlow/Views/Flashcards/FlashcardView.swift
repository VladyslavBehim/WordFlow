//
//  FlashcardView.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 02.03.2025.
//

import SwiftUI

struct FlashcardView: View {
    @State private var isFinished = false
    @State private var transitionType: TypeOfTracnsition = .moveForward
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var folder : Folder
    @ObservedObject var viewModel: FolderVM
    @StateObject var flashCardVM =  FlashCardViewModel()
    @State var learnedWords : Int = 0
    @State var stillLearningWords:Int = 0
    @Binding var stillLearinigWordsArray:[WordCard]
    var body: some View {
        VStack {
            HStack{
                Spacer()
                HStack{
                    Text("\(flashCardVM.indexOfWord)")
                    Text("|")
                    Text("\(stillLearinigWordsArray.count)")
                }
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .padding(.all, 7)
                        .background(Color(.systemGray4))
                        .clipShape(Circle())
                }
                .padding(.bottom)
                .padding(.horizontal)
                
            }
            Spacer()
            if folder.wordsInFolder.isEmpty {
                Text("Нет карточек для изучения")
                    .font(.title)
            }else if (!folder.wordsInFolder.isEmpty && stillLearinigWordsArray.isEmpty){
                Text("Вы выучили все карточки")
            }else {
                if isFinished {
                    ResultView(folder: $folder)
                        .onAppear {
                            
                        }
                }else{
                    Gauge(value: Double(flashCardVM.indexOfWord), in: 0...Double(stillLearinigWordsArray.count)) {
                    }.gaugeStyle(.accessoryLinearCapacity)
                    
                    
                    FlashcardRow(wordCard: $stillLearinigWordsArray[flashCardVM.currentIndex],
                                 folderId: folder.id,
                                 sizeOfArray: stillLearinigWordsArray.count,
                                 viewModel: viewModel, flashCardVM: flashCardVM,
                                 learnedWords: $learnedWords,
                                 stillLearningWords: $stillLearningWords,
                                 isFinished: $isFinished)
                    .transition(transitionType.transition)
                    .id(flashCardVM.currentIndex)
                    HStack{
                        KnowledgeStatusButton(title: "Still learning", action: {
                            
                        }, buttonState: .normal, knowledgeStatus: .stillLearning, quantity: $stillLearningWords)
                        KnowledgeStatusButton(title: "Learned", action: {
                            
                        }, buttonState: .normal, knowledgeStatus: .learned, quantity: $learnedWords)
                    }
                }
                
                
                
                
            }
            Spacer()
        }
        .padding()
       
        
        
    }
    
}







//#Preview {
//    FlashcardView(wordCards: [WordCard(word: "Test", translation: "тест", colorOfCard: Color.primary),WordCard(word: "test", translation: "тест", colorOfCard: Color.pink)])
//}

//
//Button {
//    flashCardVM.returnToPreviewCard() { result in
//        if result {
//            print("Successfully returned to preview card")
//            transitionType = .moveBack
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                transitionType = .moveForward
//            }
//        }else{
//            print("err")
//        }
//    }
//} label: {
//    Image(systemName: "arrow.uturn.left.circle.fill")
//        .font(.title)
//}
