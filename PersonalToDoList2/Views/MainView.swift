import SwiftUI
import SwiftData


struct MainView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var settingsToggle: Bool = false
    @State var searchedText = ""
    
    var body: some View {
        NavigationStack {
//            SettingsView()

            HamburgerMenuView()
            ZStack {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .toolbar {
                    EditButton()
                        .foregroundStyle(.primary)
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
            .listRowSeparatorTint(.red)
            .listStyle(.plain)
            .navigationTitle(Text("My day"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        MainView()
            .modelContainer(for: ItemModel.self)
            .environmentObject(ListViewModel())
    }
}
