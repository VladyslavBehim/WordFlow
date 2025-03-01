//
//  Colors.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 01.03.2025.
//

import Foundation
import SwiftUI

enum Colors: String, CaseIterable {
    case byDefault
    case system
    case blue
    case orange
    case green
    case cyan
    case pink
    case red

    var color: Color {
        switch self {
        case .system:
            return Color(.accent)
        case .blue:
            return Color(.blue)
        case .orange:
            return Color(.orange)
        case .green:
            return Color(.green)
        case .cyan:
            return Color(.cyan)
        case .pink:
            return Color(.systemPink)
        case .red:
            return Color(.systemRed)
        case .byDefault:
            return Color.primary
        }
    }

    var description: String {
        switch self {
        case .system:
            return "System"
        case .blue:
            return "Blue"
        case .orange:
            return "Orange"
        case .green:
            return "Green"
        case .cyan:
            return "Cyan"
        case .pink:
            return "Pink"
        case .red:
            return "Red"
        case .byDefault:
            return "By default"
        }
        
    }
}
