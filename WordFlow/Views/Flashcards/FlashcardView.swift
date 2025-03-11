//
//  FlashcardView.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 02.03.2025.
//

import SwiftUI

struct FlashcardView: View {
    @State var wordCards: [WordCard]
    @State private var isFinished = false
    @State private var transitionType: TypeOfTracnsition = .moveForward
    @StateObject var flashCardVM = FlashCardViewModel()
    @Environment(\.dismiss) var dismiss
    @Binding var folder : Folder
    @ObservedObject var viewModel: FolderVM

    var learnedWords:Int {
        folder.wordsInFolder.filter { $0.learned }.count
    }
    var stillLearningWords:Int {
        folder.wordsInFolder.filter { !$0.learned }.count
    }
    var body: some View {
        VStack {
            HStack{
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
            if wordCards.isEmpty {
                Text("Нет карточек для изучения")
                    .font(.title)
            } else {
                if isFinished {
                    ResultView(folder: folder)
                }else{
                    Gauge(value: Double(flashCardVM.indexOfWord), in: 0...Double(wordCards.count)) {
                    }.gaugeStyle(.accessoryLinearCapacity)
                    FlashcardRow(wordCard: wordCards[flashCardVM.currentIndex],
                                 sizeOfArray: wordCards.count,
                                 currentIndex: $flashCardVM.currentIndex ,
                                 currentWord: $flashCardVM.indexOfWord,
                                 isFinished: $isFinished, folder: $folder, viewModel: viewModel)
                    .environmentObject(flashCardVM)
                    .id(flashCardVM.currentIndex)
                    .transition(transitionType.transition)
                    
                    HStack{
                        Button {
                            flashCardVM.returnToPreviewCard(sizeOfArray: wordCards.count) { result in
                                if result {
                                    print("Successfully returned to preview card")
                                    transitionType = .moveBack
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                        transitionType = .moveForward
                                                    }
                                }else{
                                    print("err")
                                }
                            }
                        } label: {
                            Image(systemName: "arrow.uturn.left.circle.fill")
                                .font(.title)
                        }
                        
                        //Component
                        
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color(.systemRed).opacity(0.4))
                                    .frame(width: 70 , height: 50)
                                Text("\(stillLearningWords)")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color(.red))
                                    .contentTransition(.numericText())
                                Button {
                                    flashCardVM.changeIndex(sizeOfArray: wordCards.count) { Bool in
                                        
                                    }
                                } label: {
                                    Text("Still learning")
                                }

                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color(.systemGreen).opacity(0.4))
                                    .frame(width: 70 , height: 50)
                                Text("\(learnedWords)")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color(.systemGreen))
                                    .contentTransition(.numericText())
                            }
                        }
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
