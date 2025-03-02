//
//  AddingNewCard.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 01.03.2025.
//

import SwiftUI

struct AddingNewCard: View {
    @State var colorForCard : Color = Color.primary
    @State var newWord : String = String()
    @State var newWordTranslation : String = String()
    @Binding var words : [WordCard]
    @Binding var isShownTextField : Bool
    
    
    var body: some View {
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
                HStack{
                    Circle().fill(colorForCard).frame(width: 25 , height: 25)
                        .transition(.move(edge: .leading))
                    Divider()
                        .frame(height: 50)
                    HStack{
                        ForEach(Colors.allCases, id: \.self) { color in
                            Spacer()
                            Button {
                                withAnimation(.default) {
                                    colorForCard = color.color
                                }
                            } label: {
                                Circle().fill(color.color).frame(width: 20 , height: 20)
                            }
                            Spacer()

                        }

                    }
                    .frame(maxWidth:.infinity)
                    
                    
                }
                .padding(.horizontal)
            }
            Spacer()
            Button {
                let newWord = WordCard(word: newWord, translation: newWordTranslation, colorOfCard: colorForCard)
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
    }
}


