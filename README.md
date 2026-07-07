# SlideshowView

![Swift](https://img.shields.io/badge/Swift-5.0%2B-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS%2011.0%2B-lightgrey.svg)
![Version](https://img.shields.io/badge/Version-1.0.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![SPM](https://img.shields.io/badge/SPM-supported-brightgreen.svg)
![CocoaPods](https://img.shields.io/badge/CocoaPods-supported-blueviolet.svg)

An infinitely scrolling pagination control for iOS, built on top of `UICollectionView`. Supports horizontal and vertical scroll directions, auto-scrolling, and a familiar delegate/dataSource API.

## Features

- **Infinite Scrolling** — seamlessly loops through items in both directions
- **Horizontal & Vertical** — switch scroll direction with a single property
- **Auto Scroll** — configurable timer-based automatic paging
- **Paging Snap** — custom layout ensures precise page-aligned snapping with velocity-aware targeting
- **DataSource & Delegate** — familiar `UICollectionView`-style protocols
- **Objective-C Compatible** — all public APIs are `@objc` exposed
- **Lightweight** — no external dependencies, ~500 lines of Swift

## Requirements

- iOS 11.0+
- Swift 5.0+

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/iLiuChang/Slideshow.git", from: "1.0.0")
]
```

### CocoaPods

```ruby
pod 'Slideshow'
```

## Usage

### Basic Setup

```swift
import SlideshowView

let scrollView = SlideshowView()
scrollView.scrollDirection = .horizontal        // or .vertical
scrollView.autoScrollTimeInterval = 3.0         // 0 to disable auto-scroll
scrollView.interitemSpacing = 10                // spacing between pages
scrollView.dataSource = self
scrollView.delegate = self
scrollView.register(MyCell.self, forCellWithReuseIdentifier: "Cell")
```

### DataSource

```swift
extension ViewController: SlideshowViewDataSource {

    func numberOfItems(in slideshowView: SlideshowView) -> Int {
        return items.count
    }

    func slideshowView(_ slideshowView: SlideshowView, cellForItemAt index: Int) -> UICollectionViewCell {
        let cell = slideshowView.dequeueReusableCell(withReuseIdentifier: "Cell", at: index)
        // configure cell
        return cell
    }
}
```

### Delegate

```swift
extension ViewController: SlideshowViewDelegate {

    func slideshowView(_ slideshowView: SlideshowView, didSelectItemAt index: Int) {
        print("Selected item at index: \(index)")
    }

    func slideshowView(_ slideshowView: SlideshowView, willDisplay cell: UICollectionViewCell, forItemAt index: Int) {
        pageControl.currentPage = index
    }
}
```

### API Reference

| Property / Method | Description |
|---|---|
| `scrollDirection` | `.horizontal` or `.vertical` |
| `autoScrollTimeInterval` | Auto-scroll interval in seconds. `0` disables auto-scroll. |
| `interitemSpacing` | Spacing between adjacent items. |
| `disableInfiniteLoopForSingleItem` | When `true`, a single item won't loop infinitely. |
| `currentIndex` | The currently visible page index (KVO observable). |
| `scrollOffset` | Normalized scroll offset modulo item count. |
| `reloadData()` | Reloads all items. |
| `selectItem(at:animated:)` | Programmatically selects an item. |
| `scrollToItem(at:animated:)` | Scrolls to a specific item. |
| `startTimer()` / `cancelTimer()` | Manually control the auto-scroll timer. |

### Delegate Methods

| Method | Description |
|---|---|
| `didSelectItemAt` | Called when the user taps an item. |
| `willDisplay:forItemAt` | Called before a cell becomes visible. |
| `didEndDisplaying:forItemAt` | Called after a cell scrolls off screen. |
| `willBeginDragging` | Called when the user starts dragging. |
| `willEndDragging:targetIndex` | Called when dragging ends, before deceleration. |
| `didScroll` | Called on every scroll event. |
| `didEndScrollAnimation` | Called when a programmatic scroll animation finishes. |
| `didEndDecelerating` | Called when scroll deceleration completes. |

## Architecture

`SlideshowView` is a `UIView` subclass that internally manages a `UICollectionView` with a custom `SlideshowLayout`. The layout multiplies items across many virtual sections to simulate infinite scrolling, and provides velocity-based target content offset for precise page snapping.

## License

MIT License. See [LICENSE](LICENSE) for details.