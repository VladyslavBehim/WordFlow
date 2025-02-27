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
            FolderList()
                .tabItem {
                    Label("Learning", systemImage: "list.bullet.clipboard")
                }

            Text("Statistics")
                .tabItem {
                    Label("Statistics", systemImage: "chart.xyaxis.line")
                }

            Text("Settings")
                .tabItem {
                    Label("Setting", systemImage: "gear")
                }
        }
        
    }
    
}

#Preview {
    MainView()
}
