//
//  CalendarView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/16/23.
//

import SwiftUI

struct CalendarView: View {
    @State var selectDate = Date()
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    
    
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
            
            DatePicker("", selection: $selectDate)
                .datePickerStyle(.graphical)
            Spacer()
        }
     
    }
}

#Preview {
    CalendarView()
        .environmentObject(ListViewModel())
}
