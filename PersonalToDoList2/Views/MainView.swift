import SwiftUI
import SwiftData


struct MainView: View {
    
    @State var settingsToggle: Bool = false
    @State var searchedText = ""
    @State var toDoAdd = [toDoListMock]
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
            
            ZStack {
                
                List {
                    ForEach(todos, id: \.self) { todo in
                        NavigationLink(destination: TodayListView(item: todo)) {
                            Text(todo)
                        }
                    }
                }
                
                HStack(alignment: .bottom) {
                    Spacer()
                    VStack {
                        Spacer()
                        AddButtonView()
                            .padding(.bottom, 40)
                    }
                }
            }
            .listStyle(.sidebar)
            
            
            
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
            //            ToolbarItem(placement: .topBarLeading) {
            //                EditButton()
            //            }
        }
        .foregroundStyle(.primary)
    }
    
    
    func deleteItem(indexSet: IndexSet) {
        toDoAdd.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        toDoAdd.move(fromOffsets: from, toOffset: to)
    }
    
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
