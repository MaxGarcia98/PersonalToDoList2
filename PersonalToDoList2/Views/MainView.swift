import SwiftUI

struct MainView: View {
    
    @State var settingsToggle: Bool = false
    @State var items: [String] = [
        "first", "second", "third"
    ]
    
    var body: some View {
        NavigationStack {
            if items.isEmpty {
                NoItemsView()
            } else {
                List {
                    ForEach(items, id: \.self) { item in
                        ListRowView(title: item)
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
            }
            SettingsView()
            CircleView()
        }
        .navigationTitle(Text("My day"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddItemsView())
            }
        }
//        .sheet(isPresented: $settingsToggle) {
//            NavigationStack {
//                Text("Settings")
//            }
            
        
        
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
