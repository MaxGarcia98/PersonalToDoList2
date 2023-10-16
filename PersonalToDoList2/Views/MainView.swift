import SwiftUI

struct MainView: View {
    
    @State var settingsToggle: Bool = false
    @State var searchedText = ""
    @State var items: [String] = [
        "first", "second", "third"
    ]
    
    var body: some View {
        NavigationStack {
            SettingsView()
            
            List {
                ForEach(items, id: \.self) { item in
                    ListRowView(title: item)
                }
                .onDelete(perform: deleteItem)
                .onMove(perform: moveItem)
            }
            .searchable(text: $searchedText)
        }
        .navigationTitle(Text("My day"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
//            ToolbarItem(placement: .topBarLeading) {
//                Button(action: {
//                    
//                }, label: {
//                    Image(systemName: "line.3.horizontal")
//                })
//            }
            MenuItemsView()
//            ToolbarItem(placement: .topBarLeading) {
//                EditButton()
//            }
        }
        
        ZStack(alignment: .bottomTrailing) {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    AddButtonView()
                }
            }
        }
    }
    
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

}

#Preview {
    NavigationStack {
        MainView()
    }
}
