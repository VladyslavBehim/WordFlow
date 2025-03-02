//
//  ResultView.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 02.03.2025.
//

import SwiftUI

struct ResultView: View {
    @State  var knownWords: [WordCard]
    @State  var stillLearningWords: [WordCard]
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    ResultView(knownWords: [WordCard](), stillLearningWords: [WordCard]())
}
