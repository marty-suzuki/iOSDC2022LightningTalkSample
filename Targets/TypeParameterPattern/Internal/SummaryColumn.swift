//
//  SummaryColumn.swift
//
//
//  Created by marty-suzuki on 2022/08/09.
//

import Common
import UIKit

protocol SummaryColumn {
    associatedtype AdditionalView: UIView
    static func additionalView() -> AdditionalView?
}

enum Basic: SummaryColumn {
    static func additionalView() -> UIView? { nil }
}

enum Coin: SummaryColumn {
    static func additionalView() -> UIView? { nil }
}

enum ViewingType: SummaryColumn {
    static func additionalView() -> TagTextView? { TagTextView(frame: .zero) }
}
