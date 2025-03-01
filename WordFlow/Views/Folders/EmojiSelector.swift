//
//  EmojiSelector.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 01.03.2025.
//

import SwiftUI

struct EmojiSelector: View {
    var emoji = Emojis()
    @Binding var isShownEmojiSelector : Bool
    @Binding var selectedEmoji : String
    var body: some View {
        ScrollView(.vertical){
            
            EmojiComponent(selectedEmoji: $selectedEmoji, titleOfComponent: "Faces", emojis: emoji.faces)
            EmojiComponent(selectedEmoji: $selectedEmoji, titleOfComponent: "Animals and nature", emojis: emoji.animalsAndNature)
            EmojiComponent(selectedEmoji: $selectedEmoji, titleOfComponent: "Food and drinks", emojis: emoji.foodAndDrinks)
            EmojiComponent(selectedEmoji: $selectedEmoji, titleOfComponent: "Activity", emojis: emoji.activity)
            EmojiComponent(selectedEmoji: $selectedEmoji, titleOfComponent: "Traveling and places", emojis: emoji.travelingAndPlaces)
            EmojiComponent(selectedEmoji: $selectedEmoji, titleOfComponent: "Things", emojis: emoji.things)
            EmojiComponent(selectedEmoji: $selectedEmoji, titleOfComponent: "Hearts", emojis: emoji.hearts)
            
            
        }
        
        
    }
}

#Preview {
    EmojiSelector(isShownEmojiSelector: .constant(false), selectedEmoji: .constant("⚽️"))
}
