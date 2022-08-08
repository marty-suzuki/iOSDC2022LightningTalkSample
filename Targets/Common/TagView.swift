//
//  TagView.swift
//
//
//  Created by marty-suzuki on 2022/08/09.
//

import UIKit

public final class TagView: UIView {

    private let textLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let sideSpace: CGFloat = 4

    public override init(frame: CGRect) {
        super.init(frame: frame)

        layer.cornerRadius = 4
        heightAnchor.constraint(equalToConstant: 16).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black

        addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sideSpace),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sideSpace),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override class var layerClass: AnyClass {
        get {
            CAGradientLayer.self
        }
    }

    public override var intrinsicContentSize: CGSize {
        CGSize(width: textLabel.intrinsicContentSize.width + (sideSpace * 2), height: 16)
    }

    private func colors(from color1: UIColor, to color2: UIColor) {
        guard let gradientLayer = layer as? CAGradientLayer else {
            return
        }
        gradientLayer.colors = [color1, color2].map(\.cgColor)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
    }

    public func configure(_ tag: Tag) {
        switch tag {
        case .rental:
            textLabel.text = "レンタル"
            textLabel.font = .boldSystemFont(ofSize: 10)
            textLabel.textColor = .anotherYellow
            colors(from: .whiteOpacity12, to: .whiteOpacity12)
        case .free:
            textLabel.text = "無料"
            textLabel.font = .boldSystemFont(ofSize: 10)
            textLabel.textColor = .white
            colors(from: .whiteOpacity40, to: .whiteOpacity12)
        }
    }
}

#if DEBUG
import SwiftUI

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            rental()
            free()
        }
        .previewLayout(.sizeThatFits)
    }

    static func rental() -> some View {
        let view = TagView(frame: .zero)
        view.configure(.rental)
        return view.swiftUIView()
    }

    static func free() -> some View {
        let view = TagView(frame: .zero)
        view.configure(.free)
        return view.swiftUIView()
    }
}
#endif
