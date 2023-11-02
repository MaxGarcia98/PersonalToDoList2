//
//  ListRowView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/13/23.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
                .padding(.top, 4)
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                
                HStack {
                    Text(item.tododescription)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
           
            Spacer()
            
        }
        .padding(.horizontal)
        
        
    }
}

#Preview {
    ListRowView(item: ItemModel(title: "he", description: "bruh", isCompleted: true))
}
