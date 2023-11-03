import SwiftUI
import SwiftData


struct MainView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var settingsToggle: Bool = false
    @State var searchedText = ""
    @State var profileToggle = false
    
    var body: some View {
        NavigationStack {
//            SettingsView()
            ProfileMenuView()
            ZStack {
                List {
//                    HStack {
//                        Spacer()
//                        Text("Priority")
//                            .font(.headline)
//                            .fontWeight(.medium)
//                            .padding(.horizontal, 0)
//                    }
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
                
                // Add button
                HStack(alignment: .bottom) {
                    Spacer()
                    VStack {
                        Spacer()
                        AddButtonView()
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle(Text("My day"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                    EditButton()
                        .foregroundStyle(.primary)
            }
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
