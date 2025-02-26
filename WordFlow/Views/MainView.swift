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
            Tab("Learning", systemImage: "list.bullet.clipboard") {
                FolderList()
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
