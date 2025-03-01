//
//  ForderRow.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 26.02.2025.
//

import SwiftUI

struct ForderRow: View {
    
    @State var folder:Folder
    var body: some View {
        HStack{
            Text("\(self.folder.imageOfFolder)")
                .padding(.all , 10)
                .background(Color.gray.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 17))
            VStack(alignment:.leading){
                Text("\(self.folder.nameOfFolder)")
                    .fontWeight(.semibold)
                Text("The number of words is \(self.folder.quantityOfWordsINFolder)")
                
                    .font(.footnote)
                    .foregroundStyle(Color.gray)
            }
        }
    }
}

#Preview {
//    ForderRow()
}



