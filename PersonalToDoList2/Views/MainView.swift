import SwiftUI
import SwiftData


struct MainView: View {
    
    @State var settingsToggle: Bool = false
    @State var searchedText = ""
    @State var item: [ItemModel] = [
        ItemModel(title: "First Title", isCompleted: true),
        ItemModel(title: "Second", isCompleted: false),
        ItemModel(title: "Second", isCompleted: false),
        ItemModel(title: "Second", isCompleted: true),
        ItemModel(title: "Second", isCompleted: false)
    ]
    let todos = toDoListMock
    
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
                    ForEach(item) { item in
                        ListRowView(item: item)
                    }
                }
                HStack(alignment: .bottom) {
                    Spacer()
                    VStack {
                        Spacer()
                        AddButtonView()
//                            .padding(.bottom, 40)
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle(Text("My day"))
            .navigationBarTitleDisplayMode(.inline)
            // Add button
          
        }
    }
    
    
    
    
    
    
    
    
    
    
    //    func deleteItem(indexSet: IndexSet) {
    //        toDoAdd.remove(atOffsets: indexSet)
    //    }
    //
    //    func moveItem(from: IndexSet, to: Int) {
    //        toDoAdd.move(fromOffsets: from, toOffset: to)
    //    }
    
    //    func addItem() {
    //        let item = Item(name: input)
    //        modelContext.insert(item)
    //        input = ""
    //    }
    //
    //    func deleteItem(_ item: Item){
    //           modelContext.delete(item)
    //       }
    //}
}

#Preview {
    NavigationStack {
        MainView()
    }
}
