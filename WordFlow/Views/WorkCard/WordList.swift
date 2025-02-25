//
//  WordList.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 25.02.2025.
//

import SwiftUI

struct WordList: View {
    @State var isShownTextField : Bool = true
    @State var newWord : String = String()
    @State var newWordTranslation : String = String()
    @State var words : [WorkCard] = []
    var body: some View {
        VStack(spacing:0){
            
            Button {
                withAnimation(.default) {
                    isShownTextField.toggle()
                }
            } label: {
                Text(isShownTextField ? "Cancel" : "Add new word")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth:.infinity)
                    .padding(.vertical)
                    .background(Color.accentColor)
                    .contentTransition(.numericText())
            }
            
            
            if isShownTextField{
                HStack{
                    VStack{
                        TextField("Enter new word", text: $newWord)
                        TextField("Enter translation", text: $newWordTranslation)
                    }
                    Spacer()
                    Button {
                        let newWord = WorkCard(word: newWord, translation: newWordTranslation)
                        withAnimation(.default) {
                            self.newWord = ""
                            self.newWordTranslation = ""
                            words.append(newWord)
                            isShownTextField = false
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundStyle(Color.white)
                    }
                    
                }
                .padding()
                .background(Color.accentColor)
                .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 25, bottomTrailingRadius: 25))
//                .transition(
//                    .move(edge: .bottom)
//                        .combined(with: .scale(scale: 0.9, anchor: .bottom))
//                )
            }
            
            
            List(words.reversed()){ word in
                WordCardRow(wordCard: word)
            }
        }
    }
}

#Preview {
    MainView()
}
