import SwiftUI

struct MainView: View {
    
    @State var settingsToggle: Bool = false
    @State var searchedText = ""
    @State var items: [String] = [
        "first", "second", "third", "fourth", "fifth", "first", "second", "third", "fourth",
    ]
    @State var toDoAdd = [toDoList]
    let todos = toDoList
    
    var body: some View {
        NavigationStack {
            SettingsView()
                
            ZStack {
                List {
                    ForEach(todos, id: \.self) { todo in
                        NavigationLink(destination: Text(todo)) {
                            Image(systemName: "heart")
                            Text(todo)
                        }
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

}

#Preview {
    NavigationStack {
        MainView()
    }
}
