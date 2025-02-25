//
//  ContentView.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 25.02.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Words", systemImage: "list.bullet.clipboard") {
                WordList()
            }
            Tab("Statistics", systemImage: "chart.xyaxis.line") {
                Text("ds")
            }
            Tab("Setting", systemImage: "gear") {
                Text("Settings")
            }
            
            
        }
        
    }
    
}

#Preview {
    MainView()
}
