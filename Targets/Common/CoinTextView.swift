//
//  CoinTextView.swift
//
//
//  Created by marty-suzuki on 2022/08/09.
//

import UIKit

public final class CoinTextView: UIView {

    private let coinView: CoinView = {
        let view = CoinView(frame: .zero)
        view.isHidden = true
        view.setLabelColor(.white)
        return view
    }()

    private let textLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.isHidden = true
        label.textColor = .anotherRed
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)

        let stackView = UIStackView(arrangedSubviews: [
            coinView,
            textLabel
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 3
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(coin: Int?, text: String?) {
        if let coin = coin {
            coinView.isHidden = false
            coinView.setCoin(coin)
        } else {
            coinView.isHidden = true
        }

        if let text = text {
            textLabel.isHidden = false
            textLabel.text = text
        } else {
            textLabel.isHidden = true
        }
    }
}
