//
//  FlashcardRow.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 02.03.2025.
//

import SwiftUI

struct FlashcardRow: View {
    @Binding var wordCard:WordCard
    @State var folderId:String
    @State var sizeOfArray:Int
    @State var isShownTranslation: Bool = false
    @State private var offset = CGSize.zero
    @State private var cardOffset: CGSize = .zero
    @State private var feedback = UINotificationFeedbackGenerator()
    @ObservedObject var viewModel: FolderVM
    @ObservedObject var flashCardVM: FlashCardViewModel
    var speechManager = SpeechManager()
    
    @Binding var learnedWords : Int
    @Binding var stillLearningWords:Int
    @Binding var isFinished:Bool
    
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
            return Color.primary
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
                        viewModel.changeStatusOfWordTrue(from: folderId, wordId: wordCard.id)
                        learnedWords += 1
                        
                    } else {
                        feedback.notificationOccurred(.error)
                        viewModel.changeStatusOfWordFalse(from: folderId, wordId: wordCard.id)
                        stillLearningWords += 1
                    }
                    withAnimation(.default) {
                        flashCardVM.changeIndex (sizeOfArray: sizeOfArray)
                    }
                    print("flashCardVM.IndexOfWord \(flashCardVM.indexOfWord)")
                    print("flashCardVM.CurrentIdex \(flashCardVM.currentIndex)")
                    print("size of array \(sizeOfArray)")
                    
                    if flashCardVM.indexOfWord == sizeOfArray {
                        withAnimation(.default) {
                            isFinished = true
                            
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

