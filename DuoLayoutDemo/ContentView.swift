import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Toolbars", systemImage: "sidebar.right") {
                ToolbarDemoView()
            }
            Tab("Fold", systemImage: "rectangle.split.2x1") {
                FoldDemoView()
            }
            Tab("Hinge", systemImage: "book") {
                HingeDemoView()
            }
            Tab("Arrange", systemImage: "rectangle.righthalf.inset.filled") {
                ArrangeDemoView()
            }
        }
    }
}
