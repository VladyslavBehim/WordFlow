//
//  FlashcardView.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 02.03.2025.
//

import SwiftUI

struct FlashcardView: View {
    @State var wordCards: [WordCard]
    @State private var currentIndex: Int = 0
    @State private var currentWord: Int = 0
    @State private var knownWords: [WordCard] = []
    @State private var stillLearningWords: [WordCard] = []
    @State private var isFinished = false
    @Environment(\.dismiss) var dismiss
    
    @StateObject var flashCardVM = FlashCardViewModel()
    
    
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
                    ResultView(knownWords: knownWords, stillLearningWords: stillLearningWords)
                }else{
                    Gauge(value: Double(currentWord), in: 0...Double(wordCards.count)) {
                    }.gaugeStyle(.accessoryLinearCapacity)
                    FlashcardRow(wordCard: wordCards[flashCardVM.currentIndex],
                                 sizeOfArray: wordCards.count,
                                 currentIndex: $flashCardVM.currentIndex ,
                                 currentWord: $currentWord,
                                 isFinished: $isFinished,
                                 learnedWords : $knownWords,
                                 stillLearningWords: $stillLearningWords)
                    .environmentObject(flashCardVM)
                    .id(flashCardVM.currentIndex)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                    
                    HStack{
                        Button {
                            flashCardVM.returnToPreviewCard(sizeOfArray: wordCards.count) { result in
                                if result {
                                    print("Successfully returned to preview card")
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
                                Text("\(stillLearningWords.count)")
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
                                Text("\(knownWords.count)")
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



#Preview {
    FlashcardView(wordCards: [WordCard(word: "Test", translation: "тест", colorOfCard: Color.primary),WordCard(word: "test", translation: "тест", colorOfCard: Color.pink)])
}
