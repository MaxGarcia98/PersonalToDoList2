//
//  ListRowView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/13/23.
//

import SwiftUI

struct ListRowView: View {
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text("Hello")
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ListRowView()
}
