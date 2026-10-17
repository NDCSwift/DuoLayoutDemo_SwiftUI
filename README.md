# 📱 DuoLayoutDemo_SwiftUI

A SwiftUI project that shows what the **iPhone Duo** changes for your app in Xcode 27.1: **toolbars that move, a fold your layout can see, a hinge you can read, and two panes that snap to it.**

> **You are on `finished`, the completed code.** The starter is on [`main`](../../tree/main).

---

## 🤔 What this is

DuoLayoutDemo is four tabs, each one Duo behaviour. Every tab shows a size-class badge, so you can watch `compact` flip to `regular` as the phone opens.

| Tab | What it shows | Where |
|---|---|---|
| Toolbars | Two `ToolbarItem`s instead of one `HStack`, so the system can move each button into the side bar on its own. Also reads `toolbarVerticalEdge` | `ToolbarDemoView` |
| Fold | `reservedRegions(kind: .division, options: .includeInactive)` and `(kind: .occlusion)`, drawn as a live overlay of the fold and the cameras | `FoldDemoView` |
| Hinge | `.onHingeChange` reads `DeviceHinge`, and an icon tilts with the angle (closed 0°, book 127°, flat 180°) | `HingeDemoView` |
| Arrange | `ArrangementView` around a list with an editor pane, in `.automatic`, `.split` and `.overlay` styles, snapping to the fold | `ArrangeDemoView` |

## 🌿 Branches

| Branch | State |
|---|---|
| `main` | **Starter.** The app runs, but each tab has a stub where the video's code goes |
| `finished` | **Finished.** The four snippets from the video, filled in |

The four stubs on `main`:

| File | Stub | What the video types |
|---|---|---|
| `ToolbarDemoView.swift` | One trailing `ToolbarItem` holding `HStack { sortMenu; addButton }` | Two `ToolbarItem`s |
| `FoldDemoView.swift` | `RegionMap(folds: [], cameras: [])` | `GeometryReader` + `reservedRegions` |
| `HingeDemoView.swift` | No `.onHingeChange` | `.onHingeChange` |
| `ArrangeDemoView.swift` | `arrangement` is a bare `List` | `ArrangementView` around the list, with `EditorPane()` as the secondary |

To compare them: `git diff main finished`.

## ✅ Why you'd use it

- **See the Duo without owning one.** Every tab prints its own numbers (fold position, hinge angle, the editor's x range), so you can check what the layout is doing in Device Hub.
- **Small and focused.** Seven files. Each Duo API sits in its own view.
- **Lays out from size classes, not the device.** Nothing in the app asks "is this a Duo?", so the same code works on an iPad.

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://www.youtube.com/@NoahDoesCoding)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding).

---

## 🚀 Getting Started

### 1. Clone

```bash
git clone https://github.com/NDCSwift/DuoLayoutDemo_SwiftUI.git
cd DuoLayoutDemo_SwiftUI
```

To start from the finished code, run `git checkout finished`.

### 2. Open

```bash
open DuoLayoutDemo.xcodeproj
```

### 3. Run on the iPhone Duo simulator

Pick the **iPhone Duo** simulator (iOS 27.1) as the run destination and press **⌘R**. Change poses with the **Closed**, **Partially Open** and **Open** buttons in Device Hub (`Xcode.app/Contents/Applications/DeviceHub.app`). You don't need an Apple Developer account to use the simulator.

### 4. Team (device only)

Select the project in the navigator → **Signing & Capabilities** → set your own **Team**. You can skip this for the simulator.

### 5. Bundle ID (device only)

The default bundle identifier is `com.NDC.DuoLayoutDemo`. If you plan to run on a device, change it to something unique, for example `com.yourname.DuoLayoutDemo`.

## 🛠️ Notes

- **Every Duo API here needs iOS 27.1 or later.** The demo targets 27.1, so it never checks. Your app probably targets something older, so put these calls behind `if #available(iOS 27.1, *)` and keep your current layout in the `else` branch. The toolbar fix doesn't need a check, because splitting a `ToolbarItem` works on every version.
- **Mac Catalyst:** in Xcode 27.1, the 27.1 APIs show compile errors when you build for Mac Catalyst (a known issue in the release notes). Wrap the Duo code in `#if !targetEnvironment(macCatalyst)`.
- **Overlay hides the editor when the phone is flat.** In the Arrange tab, switch to `.overlay` with the Duo fully open: the list fills the screen and the editor disappears.
- **Preview a display without the simulator.** Xcode 27.1 adds a **Display** group to the preview canvas's overrides picker, so you can preview a view on the Duo's other screen.

## 📦 Requirements

- Xcode 27.1 or later (needs macOS Tahoe 26.6 or later)
- iOS 27.1+ deployment target
- iPhone Duo simulator, iOS 27.1
- Swift 6 / SwiftUI
