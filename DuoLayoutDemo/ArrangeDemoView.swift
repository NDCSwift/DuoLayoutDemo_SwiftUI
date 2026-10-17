import SwiftUI

struct ArrangeDemoView: View {
    enum Style: String, CaseIterable {
        case automatic, split, overlay
    }

    @State private var style: Style = .automatic

    var body: some View {
        VStack(spacing: 0) {
            Picker("Style", selection: $style) {
                ForEach(Style.allCases, id: \.self) { Text($0.rawValue) }
            }
            .pickerStyle(.segmented)
            .padding()

            switch style {
            case .automatic: arrangement.arrangementViewStyle(.automatic)
            case .split: arrangement.arrangementViewStyle(.split)
            case .overlay: arrangement.arrangementViewStyle(.overlay)
            }
        }
    }

    private var arrangement: some View {
        ArrangementView {
            List(1...12, id: \.self) { Text("Photo \($0)") }
        } secondary: {
            EditorPane()
        }
    }
}

struct EditorPane: View {
    @State private var span: ClosedRange<Int> = 0...0

    var body: some View {
        ZStack {
            Color.indigo.opacity(0.2)
            VStack(spacing: 8) {
                Label("Editor", systemImage: "slider.horizontal.3")
                    .font(.title2)
                Text("Editor x \(span.lowerBound)–\(span.upperBound)")
                    .font(.caption.monospaced())
            }
        }
        .onGeometryChange(for: ClosedRange<Int>.self) { proxy in
            let frame = proxy.frame(in: .global)
            return Int(frame.minX)...Int(frame.maxX)
        } action: { newValue in
            span = newValue
        }
    }
}
