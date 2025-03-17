//
//  WordRow.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 16.03.2025.
//

import SwiftUI

struct WordRow: View {
    var speechManager = SpeechManager()
    @ObservedObject var wordCard : CDWordCard
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text("\(wordCard.word)")
//                    .foregroundStyle(wordCard.colorOfCard)
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

//#Preview {
//    WordRow(wordCard: CDWordCard.exampleCDWordCard)
//        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//}
