//
//  TagCoinView.swift
//
//
//  Created by marty-suzuki on 2022/08/09.
//

import UIKit

public final class TagCoinView: UIView {

    private let tagView: TagView = {
        let view = TagView(frame: .zero)
        view.isHidden = true
        return view
    }()

    private let coinView: CoinView = {
        let view = CoinView(frame: .zero)
        view.isHidden = true
        return view
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)

        let stackView = UIStackView(arrangedSubviews: [
            tagView,
            coinView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 9
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

    public func configure(tag: Tag?, coin: Int?) {
        if let tag = tag {
            tagView.isHidden = false
            tagView.configure(tag)
        } else {
            tagView.isHidden = true
        }

        if let coin = coin {
            coinView.isHidden = false
            coinView.setCoin(coin)
        } else {
            coinView.isHidden = true
        }
    }
}
