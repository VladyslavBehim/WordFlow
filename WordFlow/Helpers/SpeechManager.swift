//
//  SpeechManager.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 02.03.2025.
//

import Foundation
import AVFoundation

class SpeechManager {
    private let synthesizer = AVSpeechSynthesizer()
    
    func speak(text: String, language: String = "en-US" , voice:String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.voice = AVSpeechSynthesisVoice(identifier: voice)
        utterance.rate = 0.5
        
        synthesizer.speak(utterance)
    }
}
