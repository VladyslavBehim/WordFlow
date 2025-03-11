//
//  WorkCardRow.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 25.02.2025.
//

import SwiftUI

struct WordCardRow: View {
    @State var wordCard : WordCard
    var speechManager = SpeechManager()
    
    var body: some View {
        
        HStack{
            VStack(alignment:.leading){
                Text("\(wordCard.word)")
                    .foregroundStyle(wordCard.colorOfCard)
                    .fontWeight(.semibold)
                Text("\(wordCard.translation)")
                    .foregroundStyle(Color.gray)
            }
            Spacer()
            Button {
                speechManager.speak(text: wordCard.word, voice: "com.apple.ttsbundle.siri_female_en-US_compact")
            } label: {
                Image(systemName: "waveform")
            }
            .buttonStyle(.borderless)
            
            

            
        }
    }
}

#Preview {
    List{
        WordCardRow(wordCard: WordCard(word: "Hello", translation: "Привет", colorOfCard: Color.red))
        WordCardRow(wordCard: WordCard(word: "Obviosly", translation: "Очевидно", colorOfCard: Color.accentColor))
        WordCardRow(wordCard: WordCard(word: "Boys", translation: "Парни", colorOfCard: Color.primary))
    }

    
}
