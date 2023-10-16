import SwiftUI

struct MainView: View {
    
    @State var settingsToggle: Bool = false
    @State var searchedText = ""
    @State var items: [String] = [
        "first", "second", "third", "fourth", "fifth", "first", "second", "third", "fourth",
    ]
    
    var body: some View {
        NavigationStack {
            SettingsView()
            
        ZStack {
            List {
                ForEach(items, id: \.self) { item in
                    ListRowView(title: item)
                        .listRowBackground(Color.secondary.opacity(0.3))
                }
                
                .onDelete(perform: deleteItem)
                .onMove(perform: moveItem)
                
                
            }
            HStack(alignment: .bottom) {
                Spacer()
                VStack {
                    Spacer()
                    AddButtonView()
                }
            }
        }
            .listStyle(.sidebar)
            .searchable(text: $searchedText)
        }
        .navigationTitle(Text("My day"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "line.3.horizontal")
                })
            }
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
        }
        .foregroundStyle(.primary)
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
