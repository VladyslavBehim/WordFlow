//
//  ContentView.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 25.02.2025.
//

import SwiftUI

struct MainView: View {
    let persistenceController = PersistenceController.shared

    var body: some View {
        TabView {
            FolderList()
                .tabItem {
                    Label("Learning", systemImage: "list.bullet.clipboard")
                }
            CDFolderListView()
                .tabItem {
                    Label("LearningTest", systemImage: "list.bullet.clipboard")
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
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
