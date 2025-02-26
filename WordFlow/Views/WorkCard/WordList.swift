//
//  WordList.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 25.02.2025.
//

import SwiftUI

struct WordList: View {
    let dateFormatter = DateFormatters()
    
    @State var isShownTextField : Bool = false
    @State var newWord : String = String()
    @State var newWordTranslation : String = String()
    @State var words : [WordCard]
    @State var dateOfCreation : Date
    @State var nameOfFolder : String
    var body: some View {
        VStack(spacing:0){
            VStack{
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
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                if isShownTextField{
                    HStack{
                        VStack{
                            TextField("Enter new word", text: $newWord)
                            TextField("Enter translation", text: $newWordTranslation)
                        }
                        Spacer()
                        Button {
                            let newWord = WordCard(word: newWord, translation: newWordTranslation)
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
                    .clipShape(UnevenRoundedRectangle(topLeadingRadius: 15, bottomLeadingRadius: 25, bottomTrailingRadius: 25 , topTrailingRadius: 15))
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            
            
            List{
                Section {
                    ForEach(words.reversed()){ word in
                        WordCardRow(wordCard: word)
                    }
                } header: {
                    HStack{
                        Text("Words")
                        Spacer()
                        Text("\(dateFormatter.formatDateDayMounthYear(dateOfCreation))")
                    }
                }
                
            }
            
        }
        .navigationTitle("\(nameOfFolder)")
    }
}

#Preview {
    WordList(words: [WordCard(word: "test", translation: "тест"), WordCard(word: "Hello", translation: "Привет")], dateOfCreation: Date(), nameOfFolder: "Lesson 2")
}
