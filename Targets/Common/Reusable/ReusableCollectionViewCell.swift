//
//  ReusableCollectionViewCell.swift
//  
//
//  Created by marty-suzuki on 2022/08/09.
//

import UIKit

final class ReusableCollectionViewCell<T: ReusableView>: UICollectionViewCell {

    let view: T = {
        let view = T(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        contentView.backgroundColor = view.backgroundColor
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
