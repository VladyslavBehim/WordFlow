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
    @State var words : [WordCard]
    @State var dateOfCreation : Date
    @State var nameOfFolder : String
    
    var body: some View {
        VStack(spacing:0){
            List{
                
                Section {
                   
                    ForEach(words.reversed()){ word in
                        WordCardRow(wordCard: word)
                    }
                } header: {
                    HStack{
                        VStack(alignment:.leading){
                            Text("Words")
                            Text("\(dateFormatter.formatDateDayMounthYear(dateOfCreation))")
                        }
                        .fontWeight(.semibold)
                        Spacer()
                        Button {
                            withAnimation(.default) {
                                isShownTextField = true
                            }
                        } label: {
                            Text("Add new word")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.white)
                                .padding(.vertical , 7)
                                .padding(.horizontal)
                                .background(Color.accentColor)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                    }
                }
                
                
            }
            .sheet(isPresented: $isShownTextField) {
                AddingNewCard(words: $words, isShownTextField: $isShownTextField)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
                    .presentationDragIndicator(.visible)
            }
            
        }
        .navigationTitle("\(nameOfFolder)")
    }
}

#Preview {
    WordList(words: [WordCard(word: "test", translation: "тест", colorOfCard: Color.primary), WordCard(word: "Hello", translation: "Привет", colorOfCard: Color.primary)], dateOfCreation: Date(), nameOfFolder: "Lesson 2")
}
