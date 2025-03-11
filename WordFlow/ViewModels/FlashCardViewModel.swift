//
//  FlashCardViewModel.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 04.03.2025.
//

import Foundation
import SwiftUI

final class FlashCardViewModel:ObservableObject {
    @Published var currentIndex : Int = 0
    @Published var indexOfWord : Int = 0
    
    
    
    func changeIndex(sizeOfArray:Int , completion: @escaping (Bool) -> Void){
        if self.currentIndex < sizeOfArray - 1{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.default) {
                    self.currentIndex += 1
                    self.indexOfWord += 1
                }
            }
            completion(true)
        }else{
            withAnimation(.default) {
                self.indexOfWord += 1
            }
            completion(false)
        }
    }
    
    func returnToPreviewCard(sizeOfArray: Int , completion: @escaping (Bool) -> Void){
        if self.currentIndex >= 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.default) {
                    self.currentIndex -= 1
                    self.indexOfWord -= 1
                }
            }
            completion(true)
        }else{
            completion(false)
        }
    }
    
}

