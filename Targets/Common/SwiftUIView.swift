//
//  SwiftUIView.swift
//
//
//  Created by marty-suzuki on 2022/08/09.
//

import SwiftUI
import UIKit

public struct SwiftUIView: UIViewRepresentable {

    private let make: () -> UIView

    public init(
        make: @escaping () -> UIView
    ) {
        self.make = make
    }

    public func makeUIView(context: Context) -> UIView {
        let view = make()
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return view
    }

    public func updateUIView(_ uiView: UIView, context: Context) {}
}

#if DEBUG
extension UIView {
    public func swiftUIView() -> SwiftUIView {
        return SwiftUIView { self }
    }
}
#endif
