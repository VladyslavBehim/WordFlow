//
//  FolderList.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 26.02.2025.
//

import SwiftUI

struct FolderList: View {
    @State var isShownAddingView : Bool = false
    @EnvironmentObject var folderViewModel : FolderViewModel
    
    var body: some View {
        NavigationView {
            List{
                Section {
                    ForEach($folderViewModel.folders){ folder in
                        NavigationLink {
                            WordList(folder: folder )
                                .environmentObject(folderViewModel)
                        } label: {
                            ForderRow(folder: folder)
                        }
                        
                    }
                    
                } header: {
                    HStack{
                        Text("Folders")
                        Spacer()
                        Button {
                            withAnimation(.default) {
                                isShownAddingView = true
                            }
                        } label: {
                            Text("Add new folder")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.white)
                                .padding(.vertical , 7)
                                .padding(.horizontal)
                                .background(Color.accentColor)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                    }
                }

                
            }
            .navigationTitle("Library")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isShownAddingView) {
                AddingNewFolder(isShownTextField: $isShownAddingView, folders: $folderViewModel.folders)
                    .presentationDetents([.height(200)])
                    .presentationCornerRadius(30)
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    
    FolderList()
}
