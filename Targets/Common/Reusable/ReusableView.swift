//
//  ReusableView.swift
//  
//
//  Created by marty-suzuki on 2022/08/09.
//

import UIKit

public protocol ReusableView: UIView {
    static var reusableIdentifier: String { get }
}

extension ReusableView {
    public static var reusableIdentifier: String {
        String(describing: Self.self)
    }
}
