//
//  Transitions.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 06.03.2025.
//

import Foundation
import SwiftUI

extension AnyTransition{
    static var moveForward: AnyTransition {
        .asymmetric(insertion: .move(edge: .trailing) .combined(with: .scale(scale: 1.5)) .combined(with: .opacity) ,
                    removal: .move(edge: .leading) .combined(with: .scale))
    }
    
    static var moveBack: AnyTransition {
        .asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
    }
}

enum TypeOfTracnsition: String, CaseIterable{
    case moveForward
    case moveBack
    
    var transition: AnyTransition {
            switch self {
            case .moveForward:
                return .moveForward
            case .moveBack:
                return .moveBack
            }
        }
}
