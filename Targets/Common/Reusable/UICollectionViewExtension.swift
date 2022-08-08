//
//  UICollectionViewExtension.swift
//  
//
//  Created by marty-suzuki on 2022/08/09.
//

import UIKit

public struct UICollectionViewReusable {
    let base: UICollectionView
}

extension UICollectionView {
    public var reusable: UICollectionViewReusable {
        UICollectionViewReusable(base: self)
    }
}

extension UICollectionViewReusable {

    public func register<T: ReusableView>(_: T.Type) {
        base.register(ReusableCollectionViewCell<T>.self, forCellWithReuseIdentifier: T.reusableIdentifier)
    }

    public func dequeueReusableView<T: ReusableView>(_: T.Type, for indexPath: IndexPath) -> DequeueResult<T> {
        let cell = base.dequeueReusableCell(
            withReuseIdentifier: T.reusableIdentifier,
            for: indexPath
        ) as! ReusableCollectionViewCell<T>
        return DequeueResult(view: cell.view, cell: cell)
    }
}
