//
//  SummaryView.swift
//
//
//  Created by marty-suzuki on 2022/08/09.
//

import Common
import UIKit

final class SummaryView: UIView {

    private let stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        return stackView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .lightBasic
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()

    private weak var subTextLabel: UILabel?

    private weak var additionalView: UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .black

        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        stackView.addArrangedSubview(titleLabel)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubTextLabel(
        text: String,
        position: Int,
        textColor: UIColor? = nil
    ) {
        let label: UILabel
        if let subTextLabel = subTextLabel {
            label = subTextLabel
            if
                let index = stackView.arrangedSubviews.firstIndex(of: subTextLabel),
                index != position
            {
                stackView.removeArrangedSubview(label)
                label.removeFromSuperview()
                stackView.insertArrangedSubview(label, at: position)
            }
        } else {
            label = UILabel(frame: .zero)
            label.textColor = textColor ?? .smokeBasic
            label.font = .systemFont(ofSize: 12)
            stackView.insertArrangedSubview(label, at: position)
        }
        label.text = text
        subTextLabel = label
    }

    private func configureView<T: UIView>(
        configure: (T) -> Void
    ) {
        let view: T
        if let additionalView = additionalView {
            if let _view = additionalView as? T {
                view = _view
            } else {
                stackView.removeArrangedSubview(additionalView)
                additionalView.removeFromSuperview()
                view = T(frame: .zero)
                stackView.addArrangedSubview(view)
            }
        } else {
            view = T(frame: .zero)
            stackView.addArrangedSubview(view)
        }
        configure(view)
        additionalView = view
    }

    private func configureTagTextView(
        tag: Tag?,
        text: String?
    ) {
        configureView { (tagTextView: TagTextView) in
            tagTextView.configure(tag: tag, text: text)
        }
    }

    private func configureTagCoinView(
        tag: Tag?,
        coin: Int?
    ) {
        configureView { (tagCoinView: TagCoinView) in
            tagCoinView.configure(tag: tag, coin: coin)
        }
    }

    private func configureCoinTextView(
        coin: Int?,
        text: String?
    ) {
        configureView { (coinTextView: CoinTextView) in
            coinTextView.configure(coin: coin, text: text)
        }
    }

    func configure(_ combination: SummaryCombination) {
        switch combination {
        case let .subTextTopBasic(startAt, title):
            titleLabel.text = title
            titleLabel.numberOfLines = 2
            configureSubTextLabel(text: startAt, position: 0)
            additionalView?.removeFromSuperview()

        case let .subTextSecondBasic(title, broadcastTime):
            titleLabel.text = title
            titleLabel.numberOfLines = 2
            configureSubTextLabel(text: broadcastTime, position: 1)
            additionalView?.removeFromSuperview()

        case let .noSubTextBasic(title):
            titleLabel.text = title
            titleLabel.numberOfLines = 3
            subTextLabel?.removeFromSuperview()
            additionalView?.removeFromSuperview()

        case let .subTextSecondCoin(title, duration, tag, coin):
            titleLabel.text = title
            titleLabel.numberOfLines = 2
            configureSubTextLabel(text: duration, position: 1)
            configureTagCoinView(tag: tag, coin: coin)

        case let .noSubTextCoin(title, coin, expirationTime):
            titleLabel.text = title
            titleLabel.numberOfLines = 2
            subTextLabel?.removeFromSuperview()
            configureCoinTextView(coin: coin, text: expirationTime)

        case let .subTextTopViewingType(seasonName, title, tag, expirationTime):
            titleLabel.text = title
            titleLabel.numberOfLines = 2
            configureSubTextLabel(text: seasonName, position: 0)
            configureTagTextView(tag: tag, text: expirationTime)

        case let .subTextSecondViewingType(title, broadcastTime, tag, expirationTime):
            titleLabel.text = title
            titleLabel.numberOfLines = 2
            configureSubTextLabel(text: broadcastTime, position: 1)
            configureTagTextView(tag: tag, text: expirationTime)

        case let .noSubTextViewingType(title, tag, expirationTime):
            titleLabel.text = title
            titleLabel.numberOfLines = 2
            subTextLabel?.removeFromSuperview()
            configureTagTextView(tag: tag, text: expirationTime)
        }
    }
}
