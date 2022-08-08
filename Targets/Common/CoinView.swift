//
//  CoinView.swift
//
//
//  Created by marty-suzuki on 2022/08/09.
//

import UIKit

public final class CoinView: UIView {
    private let coinLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .smokeBasic
        return label
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .black

        let coinIcon = UIImageView(image: UIImage(systemName: "c.circle.fill"))
        coinIcon.tintColor = .coin
        coinIcon.translatesAutoresizingMaskIntoConstraints = false
        coinIcon.contentMode = .scaleAspectFit
        addSubview(coinIcon)
        NSLayoutConstraint.activate([
            coinIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            coinIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            coinIcon.heightAnchor.constraint(equalToConstant: 12),
            coinIcon.widthAnchor.constraint(equalToConstant: 12)
        ])

        addSubview(coinLabel)
        NSLayoutConstraint.activate([
            coinLabel.topAnchor.constraint(equalTo: topAnchor),
            coinLabel.leadingAnchor.constraint(equalTo: coinIcon.trailingAnchor, constant: 3),
            coinLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            coinLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setLabelColor(_ color: UIColor) {
        coinLabel.textColor = color
    }

    public func setCoin(_ coin: Int) {
        coinLabel.text = "\(coin)"
    }
}

#if DEBUG
import SwiftUI

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        coin()
    }

    static func coin() -> some View {
        let view = CoinView(frame: .zero)
        view.setCoin(125)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 12).isActive = true
        return view.swiftUIView()
    }
}
#endif
