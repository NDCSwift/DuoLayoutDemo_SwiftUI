import SwiftUI

struct FoldDemoView: View {
    var body: some View {
        GeometryReader { proxy in
            let folds = proxy.reservedRegions(kind: .division, options: .includeInactive)
            let cameras = proxy.reservedRegions(kind: .occlusion)
            RegionMap(folds: folds, cameras: cameras)
        }
    }
}

struct RegionMap: View {
    let folds: [ReservedRegion]
    let cameras: [ReservedRegion]

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color(.systemGroupedBackground)

            ForEach(folds) { fold in
                Rectangle()
                    .fill(fold.isActive ? .red.opacity(0.35) : .gray.opacity(0.2))
                    .frame(width: fold.frame.width, height: fold.frame.height)
                    .offset(x: fold.frame.minX, y: fold.frame.minY)
            }
            ForEach(cameras) { camera in
                Rectangle()
                    .fill(.orange.opacity(0.4))
                    .frame(width: camera.frame.width, height: camera.frame.height)
                    .offset(x: camera.frame.minX, y: camera.frame.minY)
            }

            VStack(alignment: .leading, spacing: 8) {
                SizeClassBadge()
                ForEach(folds) { fold in
                    Text("Fold at x \(Int(fold.frame.minX)), \(Int(fold.frame.width)) wide, \(fold.isActive ? "active" : "inactive")")
                }
                Text("Folds: \(folds.count)  Cameras: \(cameras.count)")
            }
            .font(.caption.monospaced())
            .padding()
        }
    }
}
