//
//  SummaryCombination.swift
//
//
//  Created by marty-suzuki on 2022/08/09.
//

import Common
import UIKit

protocol SummaryCombination {
    associatedtype Row: SummaryRow
    associatedtype Column: SummaryColumn
    associatedtype AdditionalView: UIView

    static func numberOfTitleLines() -> Int
    static func additionalView() -> AdditionalView?
    static func subTextColor() -> UIColor?
}

extension SummaryCombination {
    static func subTextColor() -> UIColor? { .smokeBasic }
}

// MARK: - Basic Column

enum SubTextTopBasic: SummaryCombination {
    typealias Row = SubTextTop
    typealias Column = Basic

    static func numberOfTitleLines() -> Int { 2 }

    static func additionalView() -> UIView? { nil }
}

enum SubTextSecondBasic: SummaryCombination {
    typealias Row = SubTextSecond
    typealias Column = Basic

    static func numberOfTitleLines() -> Int { 2 }

    static func additionalView() -> UIView? { nil }
}

enum NoSubTextBasic: SummaryCombination {
    typealias Row = NoSubText
    typealias Column = Basic

    static func numberOfTitleLines() -> Int { 3 }

    static func additionalView() -> UIView? { nil }
}

// MARK: - Coin Column

enum SubTextSecondCoin: SummaryCombination {
    typealias Row = SubTextSecond
    typealias Column = Coin

    static func numberOfTitleLines() -> Int { 2 }

    static func additionalView() -> TagCoinView? { TagCoinView(frame: .zero) }
}

enum NoSubTextCoin: SummaryCombination {
    typealias Row = NoSubText
    typealias Column = Coin

    static func numberOfTitleLines() -> Int { 2 }

    static func additionalView() -> CoinTextView? { CoinTextView(frame: .zero) }
}

// MARK: - ViewingType Column

enum SubTextTopViewingType: SummaryCombination {
    typealias Row = SubTextTop
    typealias Column = ViewingType

    static func numberOfTitleLines() -> Int { 2 }

    static func additionalView() -> Column.AdditionalView? { Column.additionalView() }
}

enum SubTextSecondViewingType: SummaryCombination {
    typealias Row = SubTextSecond
    typealias Column = ViewingType

    static func numberOfTitleLines() -> Int { 2 }

    static func additionalView() -> Column.AdditionalView? { Column.additionalView() }
}

enum NoSubTextViewingType: SummaryCombination {
    typealias Row = NoSubText
    typealias Column = ViewingType

    static func numberOfTitleLines() -> Int { 2 }

    static func additionalView() -> Column.AdditionalView? { Column.additionalView() }
}
