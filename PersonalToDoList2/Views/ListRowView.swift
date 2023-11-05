//
//  ListRowView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/13/23.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    @State var dateChosen = Date()
    
    var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter
        }
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
                .padding(.top, 0)
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                
                HStack {
                    Text(item.tododescription)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
        
                    Text("\(dateChosen, formatter: dateFormatter)")
                    .font(.caption)
                
            }
           
            Spacer()
            
            Text(item.priority)
                .font(.caption)
        }
        .padding(.horizontal)
        
        
    }
}

#Preview {
    ListRowView(item: ItemModel(title: "he", description: "bruh", isCompleted: true, date: .now, priority: "!!!"))
}
