//
//  CalendarButtonView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 11/4/23.
//

import SwiftUI

struct CalendarButtonView: View {
//    @Binding var datePicked = Date()
    var body: some View {
        HStack {
          Text("April 25, 1998")
                .modifier(MenuButtonStyle())
        }
    }
    
    struct MenuButtonStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .foregroundStyle(Color(.systemGray2))
                .frame(height:20)
                .padding(2)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray2), lineWidth: 0.5)
                )
        }
    }
}

#Preview {
    CalendarButtonView()
}
