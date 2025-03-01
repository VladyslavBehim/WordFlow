//
//  WorkCardRow.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 25.02.2025.
//

import SwiftUI

struct WordCardRow: View {
    @State var wordCard : WordCard
    var body: some View {
        HStack{
            Text("\(wordCard.word)")
                .foregroundStyle(wordCard.colorOfCard)
                .fontWeight(.semibold)
            Spacer()
            Text("\(wordCard.translation)")
                .foregroundStyle(wordCard.colorOfCard.opacity(0.9))
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
