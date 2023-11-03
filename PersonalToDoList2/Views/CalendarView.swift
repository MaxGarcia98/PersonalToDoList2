//
//  CalendarView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/16/23.
//

import SwiftUI

struct CalendarView: View {
    @State private var datePicked: Date = .now
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Done") {
                    dismiss()
                }
                .foregroundStyle(.primary)
                .padding(.horizontal)
            }
            DatePicker("Choose a date:", selection: $datePicked)
                .datePickerStyle(.graphical)
        }
    }
}

#Preview {
    CalendarView()
}
