//
//  ResultView.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 02.03.2025.
//

import SwiftUI

struct ResultView: View {
    @State var folder : Folder
    var totalWords: Int {
        folder.wordsInFolder.count
        }
    var learnedWords:Int {
        folder.wordsInFolder.filter { $0.learned }.count
    }
    var stillLearningWords:Int {
        folder.wordsInFolder.filter { !$0.learned }.count
    }
        
        var knownPercentage: Double {
            totalWords > 0 ? (Double(learnedWords) / Double(totalWords)) * 100 : 0
        }
    var body: some View {
        VStack{
            Text("Your progress")
                .font(.title)
                .fontWeight(.semibold)
            HStack{
                //chart
                VStack{
                    ZStack {
                        Circle()
                            .trim(from: 0, to: 1)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 20)
                            .frame(width: 150, height: 150)
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(learnedWords) / CGFloat(max(1, totalWords)))
                            .stroke(
                                Color.green,
                                style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round)
                            )
                            .rotationEffect(.degrees(-90))
                            .frame(width: 150, height: 150)
                        
                        
                        Text("\(Int(knownPercentage))%")
                            .font(.title)
                            .fontWeight(.bold)
                            .contentTransition(.numericText())

                    }
                    .padding()
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemGreen).opacity(0.7))
                        HStack{
                            Text("Знаю")
                            Spacer()
                            Text("\(learnedWords)")
                                .contentTransition(.numericText())
                        }
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    }
                    .frame(width: 200, height: 50)

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemRed).opacity(0.7))
                        HStack{
                            Text("Еще изучаю")
                            Spacer()
                            Text("\(stillLearningWords)")
                                .contentTransition(.numericText())
                        }
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    }
                    .frame(width: 200, height: 50)

                }
            }
        }
//        .onAppear{
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                withAnimation(.easeOut(duration: 1.5)) {
//                    self.finalKnownWords = knownWords
//                    self.finalStillLearningWords = stillLearningWords
//                }
//            }
//        }
    }
}

//#Preview {
//    ResultView(knownWords: [WordCard](), stillLearningWords: [WordCard]())
//}
