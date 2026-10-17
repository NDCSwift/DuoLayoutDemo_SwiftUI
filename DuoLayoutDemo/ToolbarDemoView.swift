import SwiftUI

struct ToolbarDemoView: View {
    @Environment(\.toolbarVerticalEdge) private var verticalEdge

    var body: some View {
        NavigationStack {
            List {
                SizeClassBadge()
                LabeledContent("Vertical edge", value: edgeLabel)
                ForEach(1...20, id: \.self) { index in
                    Text("Row \(index)")
                }
            }
            .navigationTitle("Toolbars")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Settings", systemImage: "gear") {}
                }
                ToolbarItem(placement: .topBarTrailing) {
                    sortMenu
                }
                ToolbarItem(placement: .topBarTrailing) {
                    addButton
                }
            }
        }
    }

    private var sortMenu: some View {
        Menu("Sort", systemImage: "arrow.up.arrow.down") {
            Button("Newest") {}
            Button("Oldest") {}
        }
    }

    private var addButton: some View {
        Button("Add", systemImage: "plus") {}
    }

    private var edgeLabel: String {
        switch verticalEdge {
        case .leading: "leading"
        case .trailing: "trailing"
        case nil: "none"
        }
    }
}
