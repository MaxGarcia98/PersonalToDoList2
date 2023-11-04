//
//  HamburgerMenuView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 11/2/23.
//

import SwiftUI

struct ProfileMenuView: View {
    @State var profileShown = false
    var body: some View {
        Text("")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        profileShown = true
                    }, label: {
                        Image(systemName: "person.circle")
                            .foregroundStyle(Color.primary)
                    })
                }
            }
            .sheet(isPresented: $profileShown, content: {
                VStack {
                    SettingsView()
                }
            })
        Text("fd")
    }
}

#Preview {
    ProfileMenuView()
}
