//
//  SummaryRow.swift
//
//
//  Created by marty-suzuki on 2022/08/09.
//

import UIKit

protocol SummaryRow {
    static func subTextLabelAndInsertionIndex() -> (UILabel, Int)?
}

enum SubTextTop: SummaryRow {
    static func subTextLabelAndInsertionIndex() -> (UILabel, Int)? { (UILabel(frame: .zero), 0) }
}

enum SubTextSecond: SummaryRow {
    static func subTextLabelAndInsertionIndex() -> (UILabel, Int)? { (UILabel(frame: .zero), 1) }
}

enum NoSubText: SummaryRow {
    static func subTextLabelAndInsertionIndex() -> (UILabel, Int)? { nil }
}
