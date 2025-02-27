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
                VStack{
                    VStack{
                        TextField("Term", text: $newWord)
                            .padding()
                            .background(Color.gray.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 20))

                        TextField("Definition", text: $newWordTranslation)
                            .padding()
                            .background(Color.gray.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    Button {
                        let newWord = WordCard(word: newWord, translation: newWordTranslation)
                        withAnimation(.default) {
                            self.newWord = ""
                            self.newWordTranslation = ""
                            words.append(newWord)
                            isShownTextField = false
                        }
                    } label: {
                        Text("Add word")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.white)
                            .padding(.vertical)
                            .frame(maxWidth:.infinity)
                            .background(Color.accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    .padding(.vertical)
                    
                    
                }
                .padding()
                .presentationDetents([.height(270)])
                .presentationCornerRadius(30)
                .presentationDragIndicator(.visible)
            }
                        
        }
        .navigationTitle("\(nameOfFolder)")
    }
}

#Preview {
    WordList(words: [WordCard(word: "test", translation: "тест"), WordCard(word: "Hello", translation: "Привет")], dateOfCreation: Date(), nameOfFolder: "Lesson 2")
}
