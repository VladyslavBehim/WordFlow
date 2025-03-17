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
    @Binding var isShownTextField : Bool
    let folder : CDFolder?
    @Environment(\.managedObjectContext) var context

    

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
            }
            
            Spacer()
            Button {
                withAnimation(.default) {
                    let word = CDWordCard(word: newWord, translation: newWordTranslation, context: context)
                    word.folder = folder
                    PersistenceController.shared.save()
                    isShownTextField = false
                    
                }
                self.newWord = ""
                self.newWordTranslation = ""
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


