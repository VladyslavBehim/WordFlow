//
//  Components.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 16.03.2025.
//

import Foundation
import SwiftUI

enum StageOfButton{
    case normal , pressed , disabled
}
enum KnowledgeStatus{
    case learned , stillLearning
}

struct KnowledgeStatusButton: View {
    var title: String
    var action: () -> Void
    @State var buttonState: StageOfButton = .normal
    @State var knowledgeStatus: KnowledgeStatus
    @Binding var quantity : Int
    var body: some View {
        Button(action: {
            if buttonState != .disabled {
                withAnimation(.default) {
                    buttonState = .pressed
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.default) {
                        buttonState = .normal
                    }
                }
                action()
            }
        }) {
            HStack{
                Text(title)
                Text("\(quantity)")
            }
            .foregroundColor(buttonState == .disabled ? .gray : .white)
            .padding(.horizontal)
            .padding(.vertical , 10)
            .frame(maxWidth: .infinity)
            .background(backgroundColor(for: knowledgeStatus))
            .cornerRadius(20)
            .opacity(buttonState == .disabled ? 0.5 : 1.0)
            .fontWeight(.semibold)
        }
        .disabled(buttonState == .disabled)
        .shadow(radius: 3)

    }
    
    private func backgroundColor(for state: KnowledgeStatus ) -> Color {
        switch state {
        case .learned:
            return ButtonFilledColorsKnowledgeStatus.learned
        case .stillLearning:
            return ButtonFilledColorsKnowledgeStatus.stillLearning
        }
    }
}


#Preview {
    HStack{
        KnowledgeStatusButton(title: "Learned", action: {
            
        }, buttonState: .normal, knowledgeStatus: .learned, quantity: .constant(5))
        KnowledgeStatusButton(title: "Still learning", action: {
            
        }, buttonState: .normal, knowledgeStatus: .stillLearning, quantity: .constant(5))
    }
    
}
