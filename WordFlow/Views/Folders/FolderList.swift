//
//  FolderList.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 26.02.2025.
//

import SwiftUI

struct FolderList: View {
    @State var isShownAddingView : Bool = false
    
    @StateObject var viewModel = FolderVM(repository: FolderRepository())
    
    var body: some View {
        NavigationStack {
            List{
                Section {
                    ForEach($viewModel.folders){ folder in
                        NavigationLink {
                            WordList(folder: folder, viewModel: viewModel )
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
                AddingNewFolder(isShownTextField: $isShownAddingView, viewModel: viewModel)
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
