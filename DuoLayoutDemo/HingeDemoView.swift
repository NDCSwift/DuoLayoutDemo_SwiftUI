import SwiftUI

struct HingeDemoView: View {
    @State private var hinge: DeviceHinge?

    var body: some View {
        VStack(spacing: 24) {
            SizeClassBadge()
            Image(systemName: "book.pages")
                .font(.system(size: 96))
                .rotation3DEffect(tilt, axis: (x: 0, y: 1, z: 0))
            Text(statusLabel)
                .font(.title2.bold())
            Text(angleLabel)
                .font(.body.monospaced())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onHingeChange { _, newContext in
            hinge = newContext.hinge
        }
    }

    private var tilt: Angle {
        guard let hinge else { return .zero }
        return .degrees((180 - hinge.angle.degrees) / 3)
    }

    private var statusLabel: String {
        guard let status = hinge?.status else { return "No hinge" }
        switch status {
        case .closed: return "Closed"
        case .partiallyOpen: return "Partially open"
        case .fullyOpen: return "Fully open"
        default: return "Unknown"
        }
    }

    private var angleLabel: String {
        guard let hinge else { return "angle: none" }
        return "angle: \(Int(hinge.angle.degrees))°"
    }
}
