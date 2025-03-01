//
//  EmojiComponent.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 01.03.2025.
//

import SwiftUI

struct EmojiComponent: View {
    @Binding var selectedEmoji:String
    @State var titleOfComponent : String
    @State var emojis : [String]
    @Environment(\.dismiss) var dismiss

    let rows = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var body: some View {
        VStack(alignment:.leading){
            Text("\(titleOfComponent)")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.top)
                .padding(.horizontal)
            ScrollView(.horizontal){
                LazyHGrid(rows: rows) {
                    ForEach(emojis, id: \.self){ emoji in
                        Button {
                            dismiss()
                            selectedEmoji = emoji
                        } label: {
                            Text("\(emoji)")
                                .font(.title)
                                .padding(.all , 13)
                                .background(selectedEmoji == emoji ? Color.accentColor.opacity(0.8) : Color.gray.opacity(0.8))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 17)
                                        .stroke(Color.accentColor, lineWidth: 2)
                                        .padding(.all,1)

                                }
                        }

                    }
                }
                .padding(.horizontal)

            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    EmojiComponent(selectedEmoji: .constant("🐼"), titleOfComponent: "Emoji", emojis: ["🐶"])
}
