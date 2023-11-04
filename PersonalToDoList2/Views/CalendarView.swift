//
//  CalendarView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/16/23.
//

import SwiftUI

struct CalendarView: View {
    @State var datePicked = Date()
    @Environment(\.dismiss) var dismiss
    @StateObject var dateManager = DateManager()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Done") {
                    dismiss()
                }
                .foregroundStyle(.primary)
                .padding(.horizontal)
                .padding(.top)
            }
            DatePicker("Choose a date:", selection: $dateManager.dateChosen)
                .datePickerStyle(.graphical)
            Spacer()
        }
        .environmentObject(dateManager)
    }
}

#Preview {
    CalendarView()
}
