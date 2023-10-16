//
//  SideMenuView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/16/23.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.title)
                .foregroundStyle(.white)
            
            Spacer()
        }
        .padding(50)
        .background(Color.black)
        .background(ignoresSafeAreaEdges: .bottom)
    }
}

#Preview {
    SideMenuView()
}
