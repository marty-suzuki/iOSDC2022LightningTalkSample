//
//  SummaryView.swift
//
//
//  Created by marty-suzuki on 2022/08/09.
//

import Common
import UIKit

final class SummaryView<Combination: SummaryCombination>: UIView {

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
        label.numberOfLines = Combination.numberOfTitleLines()
        return label
    }()

    private let subTextLabel: UILabel?
    private let additionalView: Combination.AdditionalView?

    override init(frame: CGRect) {
        let subTextLabelAndInsertionIndex = Combination.Row.subTextLabelAndInsertionIndex()
        self.subTextLabel = subTextLabelAndInsertionIndex?.0
        self.additionalView = Combination.additionalView()

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
        if let (subTextLabel, index) = subTextLabelAndInsertionIndex {
            subTextLabel.textColor = Combination.subTextColor()
            subTextLabel.font = .systemFont(ofSize: 12)
            stackView.insertArrangedSubview(subTextLabel, at: index)
        }

        if let additionalView = additionalView {
            stackView.addArrangedSubview(additionalView)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setTitle(_ title: String?) {
        titleLabel.text = title
    }
}

// MARK: - SubTextXxx Row

extension SummaryView where Combination.Row == SubTextTop {

    private func setSubText(_ text: String) {
        subTextLabel?.text = text
    }
}

extension SummaryView where Combination.Row == SubTextSecond {

    private func setSubText(_ text: String) {
        subTextLabel?.text = text
    }
}

// MARK: - Basic Column

extension SummaryView where Combination == SubTextTopBasic {

    func configure(
        startAt: String,
        title: String
    ) {
        setTitle(title)
        setSubText(startAt)
    }
}

extension SummaryView where Combination == SubTextSecondBasic {

    func configure(
        title: String,
        broadcastTime: String
    ) {
        setTitle(title)
        setSubText(broadcastTime)
    }
}

extension SummaryView where Combination == NoSubTextBasic {

    func configure(title: String) {
        setTitle(title)
    }
}

// MARK: - Coin Column

extension SummaryView where Combination == SubTextSecondCoin {

    func configure(
        title: String,
        duration: String,
        tag: Tag?,
        coin: Int?
    ) {
        setTitle(title)
        setSubText(duration)
        additionalView?.configure(tag: tag, coin: coin)
    }
}

extension SummaryView where Combination == NoSubTextCoin {

    func configure(
        title: String,
        coin: Int?,
        expirationTime: String?
    ) {
        setTitle(title)
        additionalView?.configure(coin: coin, text: expirationTime)
    }
}

// MARK: - ViewingType Column

extension SummaryView where Combination == SubTextTopViewingType {

    func configure(
        seasonName: String,
        title: String,
        tag: Tag?,
        expirationTime: String?
    ) {
        setTitle(title)
        setSubText(seasonName)
        additionalView?.configure(tag: tag, text: expirationTime)
    }
}

extension SummaryView where Combination == SubTextSecondViewingType {

    func configure(
        title: String,
        broadcastTime: String,
        tag: Tag?,
        expirationTime: String?
    ) {
        setTitle(title)
        setSubText(broadcastTime)
        additionalView?.configure(tag: tag, text: expirationTime)
    }
}

extension SummaryView where Combination == NoSubTextViewingType {

    func configure(
        title: String,
        tag: Tag?,
        expirationTime: String?
    ) {
        setTitle(title)
        additionalView?.configure(tag: tag, text: expirationTime)
    }
}
