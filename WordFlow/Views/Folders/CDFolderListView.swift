//
//  CDFolderListView.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 16.03.2025.
//

import SwiftUI
import CoreData

struct CDFolderListView: View {
    @FetchRequest(fetchRequest: CDFolder.fetch(), animation: .default)
    var foldersGrops : FetchedResults<CDFolder>
//    @State var folders:[CDFolder]
    @Environment(\.managedObjectContext) var context
    
    @State var isShownAddingView : Bool = false
    @StateObject var viewModel = FolderVM(repository: FolderRepository())
    
    var body: some View {
        NavigationStack {
            List{
                Button {
                    let newFolder = CDFolder(imageOfFolder: "🥲", nameOfFolder: "new", context: context)
                    PersistenceController.shared.save()
                    
                } label: {
                    Text("Add folder")
                }

                Section {
                    ForEach(foldersGrops){ folder in
                        NavigationLink {
                            CDWordListView(folder: folder, viewModel: viewModel)
                        } label: {
                            CDFolderRow(folder: folder)
//                            HStack{
//                                Text(folder.nameOfFolder)
//                                Text("\(folder.imageOfFolder)")
//                                Spacer()
//                                Button {
//                                    CDFolder.delete(folder: folder)
//                                } label: {
//                                    Text("Remove")
//                                }
//
//                            }
                            
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
    CDFolderListView()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
