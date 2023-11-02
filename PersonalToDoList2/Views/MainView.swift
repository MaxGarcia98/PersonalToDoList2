import SwiftUI
import SwiftData


struct MainView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var settingsToggle: Bool = false
    @State var searchedText = ""
    
    var body: some View {
        NavigationStack {
            SettingsView()
            //
            //            VStack {
            //                HStack {
            //                    TextField("Add an item", text: $input)
            //                    Button("Add item") {
            //                      addItem()
            //                    }
            //                }
            //                List{
            //                    ForEach (items) { item in
            //                        Text(item.name)
            //                    }.onDelete(perform: { indexSet in
            //                        for index in indexSet{
            //                            deleteItem(items[index])
            //                        }
            //                    })
            //                }
            //            }.padding()
            //
            HamburgerMenuView()
            ZStack {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                // Add button
                HStack(alignment: .bottom) {
                    Spacer()
                    VStack {
                        Spacer()
                        AddButtonView()
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle(Text("My day"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        MainView()
            .environmentObject(ListViewModel())
    }
}
