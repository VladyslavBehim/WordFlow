//
//  AddingNewFolder.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 01.03.2025.
//

import SwiftUI

struct AddingNewFolder: View {
    @State var nameOfFolder: String = String()
    @State var selectedEmoji: String = "📂"
    @Binding var isShownTextField : Bool
    @Binding var folders : [Folder]

    var body: some View {
        VStack{
            HStack{
                Text("\(selectedEmoji)")
                    .padding()
                    .background(Color.accentColor.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 17))
                TextField("Name of folder", text: $nameOfFolder)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            Spacer()
            Button {
                let newWord = Folder(nameOfFolder: nameOfFolder, wordsInFolder: [WordCard](), imageOfFolder: selectedEmoji, quantityOfWordsINFolder: 0)
                withAnimation(.default) {
                    folders.append(newWord)
                    isShownTextField = false
                }
            } label: {
                Text("Add folder")
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

#Preview {
    FolderList()
}
