//
//  FlashcardRow.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 02.03.2025.
//

import SwiftUI

struct FlashcardRow: View {
    @State var wordCard:WordCard
    @State var sizeOfArray:Int
    @State var isShownTranslation: Bool = false
    @State private var offset = CGSize.zero
    @State private var cardOffset: CGSize = .zero
    @State private var feedback = UINotificationFeedbackGenerator()
    @Binding var currentIndex : Int
    @Binding var currentWord : Int
    @Binding var isFinished : Bool
    @Binding var folder :Folder
    @EnvironmentObject var flashCardsVM : FlashCardViewModel
    @ObservedObject var viewModel: FolderVM
    var speechManager = SpeechManager()
    
    var body: some View {
        
        VStack{
            HStack{
                Spacer()
                Button {
                    speechManager.speak(text: wordCard.word, voice: "com.apple.ttsbundle.siri_female_en-US_compact")
                } label: {
                    Image(systemName: "speaker.wave.2.fill")
                }
                .padding()
                
            }
            if !isShownTranslation{
                
                Text("\(wordCard.word)")
                    .font(.title)
                    .frame(maxWidth:.infinity)
                    .frame(maxHeight:.infinity)
                    .transition(.asymmetric(insertion: .move(edge: .bottom) .combined(with: .scale) .combined(with: .opacity), removal: .move(edge: .top) .combined(with: .scale) .combined(with: .opacity)))
                    .multilineTextAlignment(.center)
                
            }else{
                
                Text("\(wordCard.translation)")
                    .font(.title)
                    .frame(maxWidth:.infinity)
                    .frame(maxHeight:.infinity)
                    .transition(.asymmetric(insertion: .move(edge: .bottom) .combined(with: .scale) .combined(with: .opacity), removal: .move(edge: .top) .combined(with: .scale) .combined(with: .opacity)))
                    .multilineTextAlignment(.center)
            }
            
            
            
        }
        .foregroundStyle(Color.primary)
        .padding()
        .background(getComputedBackground())
        .clipShape(RoundedRectangle(cornerRadius: 45))
        .padding()
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .gesture(dragGesture())
        .onTapGesture {
            withAnimation(.default) {
                isShownTranslation.toggle()
            }
        }
        .animation(.spring(), value: cardOffset)
        
        
    }
    
    private func getComputedBackground() -> Color {
        if offset == .zero {
            if wordCard.colorOfCard == Color.primary {
                return Color(.wordCardBackground)
            }else{
                return wordCard.colorOfCard.opacity(0.6)
            }
        }  else {
            return getBackgroundColor(offset: offset)
        }
    }
    
    private func getBackgroundColor(offset: CGSize) -> Color {
        if offset.width > 0 {
            
            return .green
        }
        if offset.width < 0 {
            return .red
        }
        return .white
    }
    
    private func dragGesture() -> some Gesture {
        DragGesture()
            .onChanged { gesture in
                withAnimation(.bouncy){
                    offset = gesture.translation
                }
                feedback.prepare()
            }
            .onEnded { _ in
                if abs(offset.width) > 100 {
                    if offset.width > 0 {
                        feedback.notificationOccurred(.success)
                        viewModel.changeStatusOfWordTrue(from: folder.id, wordId: folder.wordsInFolder[flashCardsVM.indexOfWord].id)
                    } else {
                        feedback.notificationOccurred(.error)
                        viewModel.changeStatusOfWordFalse(from: folder.id, wordId: folder.wordsInFolder[flashCardsVM.indexOfWord].id)

                    }
                    
                    
                    flashCardsVM.changeIndex(sizeOfArray: sizeOfArray) { result in
                        if !result {
                            withAnimation(.default) {
                                isFinished = true
                            }
                            print("Все карточки пройдены!")
                        }
                    }
                    
                    
                } else {
                    withAnimation(.default) {
                        offset = .zero
                    }
                }
            }
    }
}

//#Preview {
//    FlashcardRow(wordCard: WordCard(word: "Hello , my name is Vladislav , and I am 22 years old", translation: "Привет, мой имя Владислав, и я 22 года", colorOfCard: Color.primary), sizeOfArray: 3, currentIndex: .constant(0), currentWord: .constant(0), isFinished: .constant(false), learnedWords: .constant([WordCard]()), stillLearningWords: .constant([WordCard]()))
//}
