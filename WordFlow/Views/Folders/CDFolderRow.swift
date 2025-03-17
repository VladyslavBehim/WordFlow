//
//  CDFolderRow.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 17.03.2025.
//

import SwiftUI

struct CDFolderRow: View {
    let folder : CDFolder
    var body: some View {
        HStack{
            Text("\(self.folder.imageOfFolder)")
                .padding(.all , 10)
                .background(Color.gray.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 17))
            VStack(alignment:.leading){
                Text("\(self.folder.nameOfFolder)")
                    .fontWeight(.semibold)
//                Text("The number of words is \(folder.quantityOfWordsInFolder)")
//                
//                    .font(.footnote)
//                    .foregroundStyle(Color.gray)
            }
        }
    }
}

