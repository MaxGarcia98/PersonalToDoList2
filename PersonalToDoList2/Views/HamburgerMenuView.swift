//
//  HamburgerMenuView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 11/2/23.
//

import SwiftUI

struct HamburgerMenuView: View {
    var body: some View {
        
        Text("")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                    })
                }
                //            ToolbarItem(placement: .topBarLeading) {
                //                EditButton()
                //            }
            }
            .foregroundStyle(.primary)
        
    }
}

#Preview {
    HamburgerMenuView()
}
