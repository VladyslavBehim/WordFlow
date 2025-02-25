//
//  WorkCardRow.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 25.02.2025.
//

import SwiftUI

struct WordCardRow: View {
    @State var wordCard : WorkCard
    var body: some View {
        HStack{
            Text("\(wordCard.word)")
            Spacer()
            Text("\(wordCard.translation)")
                .foregroundStyle(Color.gray)
        }
    }
}

#Preview {
    MainView()
//    WordCardRow(wordCard: WorkCard(word: "Hello", translation: "Привет"))
}
