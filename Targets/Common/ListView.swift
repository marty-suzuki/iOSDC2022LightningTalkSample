//
//  ListView.swift
//  
//
//  Created by marty-suzuki on 2022/08/09.
//

import UIKit

public final class ListView<SummaryView: UIView>: UIView, ReusableView {

    public let summaryView: SummaryView = {
        let view = SummaryView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .black

        let thumbnailView = UIView(frame: .zero)
        thumbnailView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailView.backgroundColor = .secondaryBlack
        thumbnailView.layer.cornerRadius = 4
        NSLayoutConstraint.activate([
            thumbnailView.widthAnchor.constraint(equalToConstant: 128),
            thumbnailView.heightAnchor.constraint(equalToConstant: 72)
        ])

        let plusImageView = UIImageView(image: UIImage(systemName: "plus"))
        plusImageView.contentMode = .scaleAspectFit
        plusImageView.translatesAutoresizingMaskIntoConstraints = false
        plusImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        plusImageView.tintColor = .smokeBasic

        let summaryContainerView = UIView(frame: .zero)
        summaryContainerView.translatesAutoresizingMaskIntoConstraints = false
        summaryContainerView.addSubview(summaryView)
        NSLayoutConstraint.activate([
            summaryView.topAnchor.constraint(greaterThanOrEqualTo: summaryContainerView.topAnchor),
            summaryView.bottomAnchor.constraint(lessThanOrEqualTo: summaryContainerView.bottomAnchor),
            summaryView.centerYAnchor.constraint(equalTo: summaryContainerView.centerYAnchor),
            summaryView.leadingAnchor.constraint(equalTo: summaryContainerView.leadingAnchor),
            summaryView.trailingAnchor.constraint(equalTo: summaryContainerView.trailingAnchor),
            summaryView.widthAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ])

        let stackView = UIStackView(arrangedSubviews: [
            thumbnailView,
            summaryContainerView,
            plusImageView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.setCustomSpacing(12, after: thumbnailView)
        stackView.setCustomSpacing(8, after: summaryContainerView)

        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if DEBUG
import SwiftUI

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        listView()
            .previewLayout(.fixed(width: 375, height: 88))
    }

    private static func listView() -> some View {
        let view = ListView<UILabel>(frame: .zero)
        view.summaryView.text = Array(repeating: "タイトルが入ります", count: 5).joined()
        view.summaryView.numberOfLines = 0
        view.summaryView.textColor = .smokeBasic
        view.summaryView.backgroundColor = .whiteOpacity12
        view.summaryView.widthAnchor.constraint(equalToConstant: 177).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view.swiftUIView()
    }
}
#endif
