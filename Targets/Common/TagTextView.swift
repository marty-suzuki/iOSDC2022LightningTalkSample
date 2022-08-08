//
//  TagTextView.swift
//
//
//  Created by marty-suzuki on 2022/08/09.
//

import UIKit

public final class TagTextView: UIView {

    private let tagView: TagView = {
        let view = TagView(frame: .zero)
        view.isHidden = true
        return view
    }()

    private let textLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.isHidden = true
        label.textColor = .smokeBasic
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)

        let stackView = UIStackView(arrangedSubviews: [
            tagView,
            textLabel
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

    public func configure(tag: Tag?, text: String?) {
        if let tag = tag {
            tagView.isHidden = false
            tagView.configure(tag)
        } else {
            tagView.isHidden = true
        }

        if let text = text {
            textLabel.isHidden = false
            textLabel.text = text
        } else {
            textLabel.isHidden = true
        }
    }
}
