//
//  AddingNewFolder.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 01.03.2025.
//

import SwiftUI

struct AddingNewFolder: View {
    @State var nameOfFolder: String = String()
    @State var isShownEmojiSelector : Bool = false
    @State var selectedEmoji: String = "📂"
    @Binding var isShownTextField : Bool
    @ObservedObject var viewModel: FolderVM
    @Environment(\.managedObjectContext) var context

    var body: some View {
        VStack{
            HStack{
                Button {
                    isShownEmojiSelector = true
                } label: {
                    Text("\(selectedEmoji)")
                        .padding()
                        .background(Color.accentColor.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 17))
                }

                
                TextField("Name of folder", text: $nameOfFolder)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            Spacer()
            Button {
//                let newWord = Folder( nameOfFolder: nameOfFolder, wordsInFolder: [WordCard](), imageOfFolder: selectedEmoji)
                withAnimation(.default) {
                    viewModel.createFolder(nameOfFolder: nameOfFolder, imageOfFolder: selectedEmoji)
                    let newFolder = CDFolder(imageOfFolder: selectedEmoji, nameOfFolder: nameOfFolder, context: context)
                    PersistenceController.shared.save()
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
        .sheet(isPresented: $isShownEmojiSelector) {
            EmojiSelector(isShownEmojiSelector: $isShownEmojiSelector, selectedEmoji: $selectedEmoji)
                .presentationDetents([.fraction(0.65) , .large])
                .presentationCornerRadius(30)
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    FolderList()
}
