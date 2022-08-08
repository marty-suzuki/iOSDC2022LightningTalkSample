//
//  DequeueResult.swift
//  
//
//  Created by marty-suzuki on 2022/08/09.
//

import UIKit

public struct DequeueResult<T: ReusableView> {
    public let view: T
    public let cell: UICollectionViewCell

    init(
        view: T,
        cell: UICollectionViewCell
    ) {
        self.view = view
        self.cell = cell
    }
}
