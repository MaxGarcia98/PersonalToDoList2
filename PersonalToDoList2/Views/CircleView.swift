//
//  CircleView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/13/23.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        Circle()
            .fill(.gray)
            .offset(y: 200)
            .shadow(color: .gray, radius: 40)
            .opacity(0.8)
    }
}

#Preview {
    CircleView()
}
