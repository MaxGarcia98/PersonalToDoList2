//
//  TodayMenuView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/16/23.
//

import SwiftUI

struct TodayListView: View {
    
    var item: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                Text("hel")
                Text("jhe")
            }
        }
    }
}

#Preview {
    TodayListView()
}




/*
 ZStack {
     VStack {
         Image(systemName: "heart")
             .resizable()
             .scaledToFit()
             .frame(width: 100, height: 100)
             .padding()
         Text("Make something happen from planning the day ahead.")
             .multilineTextAlignment(.center)
             .font(.headline)
             .fontWeight(.semibold)
             .padding(3)
         Text("Rest is as important as working hard.")
             .font(.caption2)
             .fontWeight(.semibold)
     }
         AddButtonView()
         .frame(maxWidth: .infinity ,maxHeight: .infinity, alignment: .bottomTrailing)
 }
 .navigationTitle("Today")
 .toolbarTitleDisplayMode(.inline)
 .toolbar {
     ToolbarItem {
         Image(systemName: "ellipsis")
     }
     ToolbarItem(placement: .topBarLeading) {
//                    MenuItemsView()
     }
 }
 
 
 */
