import SwiftUI

/// Spell view-local state `@ViewState`, never `@State`.
///
/// From the macOS 27 SDK on, `@State` resolves to SwiftUI's `State()` macro,
/// whose compiler plugin (`SwiftUIMacros`) ships only inside Xcode.app. With
/// just the Command Line Tools, every view using `@State` fails to build
/// ("plugin for module 'SwiftUIMacros' not found", then "cannot assign to
/// property: 'self' is immutable" and missing `$` projections).
///
/// A typealias can't name a macro, so `@ViewState` always resolves to the
/// `State` property-wrapper type itself: same storage, same `$` binding,
/// same `_name` backing property, on every SDK and toolchain.
typealias ViewState<Value> = SwiftUI.State<Value>
