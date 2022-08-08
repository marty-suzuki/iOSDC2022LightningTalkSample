//
//  ViewController.swift
//  
//
//  Created by marty-suzuki on 2022/08/09.
//

import Common
import UIKit
import struct os.OSSignposter

public class ViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout
        )
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.reusable.register(ListView<SummaryView<SubTextTopBasic>>.self)
        collectionView.reusable.register(ListView<SummaryView<SubTextSecondBasic>>.self)
        collectionView.reusable.register(ListView<SummaryView<NoSubTextBasic>>.self)
        collectionView.reusable.register(ListView<SummaryView<SubTextSecondCoin>>.self)
        collectionView.reusable.register(ListView<SummaryView<NoSubTextCoin>>.self)
        collectionView.reusable.register(ListView<SummaryView<SubTextTopViewingType>>.self)
        collectionView.reusable.register(ListView<SummaryView<SubTextSecondViewingType>>.self)
        collectionView.reusable.register(ListView<SummaryView<NoSubTextViewingType>>.self)
        return collectionView
    }()

    private let collectionViewLayout = UICollectionViewCompositionalLayout { _, _ in
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(88)
            ),
            subitem: item,
            count: 1
        )
        return NSCollectionLayoutSection(group: group)
    }

    private let viewDataModels: [ViewDataModel] = Array(repeating: [
        .subTextTopBasic(
            startAt: "18:30 ~",
            title: "タイトルが2行まで入りますタイトルが2行まで入りますタイトルが2行まで入ります"
        ),
        .subTextSecondBasic(
            title: "タイトルが2行まで入りますタイトルが2行まで入りますタイトルが2行まで入ります",
            broadcastTime: "10月3日(金)22:00 ~ 23:00"
        ),
        .noSubTextBasic(
            title: "タイトルが3行まで入りますタイトルが3行まで入りますタイトルが3行まで入りますタイトルが3行まで入ります"
        ),
        .subTextSecondCoin(
            title: "タイトルが2行まで入りますタイトルが2行まで入りますタイトルが2行まで入ります",
            duration: "1時間54分",
            tag: .rental,
            coin: 125
        ),
        .noSubTextCoin(
            title: "タイトルが2行まで入りますタイトルが2行まで入りますタイトルが2行まで入ります",
            coin: 125,
            expirationTime: "あと42時間"
        ),
        .subTextTopViewingType(
            seasonName: "シーズン名が入ります",
            title: "タイトルが2行まで入りますタイトルが2行まで入りますタイトルが2行まで入ります",
            tag: .free,
            expirationTime: "あと14日間"
        ),
        .subTextSecondViewingType(
            title: "タイトルが2行まで入りますタイトルが2行まで入りますタイトルが2行まで入ります",
            broadcastTime: "10月3日(金)22:00 ~ 23:00",
            tag: .free,
            expirationTime: "あと14日間"
        ),
        .noSubTextViewingType(
            title: "タイトルが2行まで入りますタイトルが2行まで入りますタイトルが2行まで入ります",
            tag: .free,
            expirationTime: "あと14日間"
        )
    ], count: 20).flatMap { $0 }

    private let signposterForCellForItemAt = OSSignposter(
        subsystem: "\(Bundle.main.bundleIdentifier!)_cellForItemAt_meaturement",
        category: .pointsOfInterest
    )

    private let signposterForConfigure = OSSignposter(
        subsystem: "\(Bundle.main.bundleIdentifier!)_configure_meaturement",
        category: .pointsOfInterest
    )
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        title = "Type Parameter"

        collectionView.dataSource = self
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewDataModels.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewDataModel = viewDataModels[indexPath.row]
        let pointOfInterestName = viewDataModel.toStaticString()
        let state = signposterForCellForItemAt.beginInterval(pointOfInterestName)
        defer {
            signposterForCellForItemAt.endInterval(pointOfInterestName, state)
        }

        switch viewDataModel {
        case let .subTextTopBasic(startAt, title):
            let result = collectionView.reusable.dequeueReusableView(ListView<SummaryView<SubTextTopBasic>>.self, for: indexPath)
            let state = signposterForConfigure.beginInterval(pointOfInterestName)
            result.view.summaryView.configure(startAt: startAt, title: title)
            signposterForConfigure.endInterval(pointOfInterestName, state)
            return result.cell

        case let .subTextSecondBasic(title, broadcastTime):
            let result = collectionView.reusable.dequeueReusableView(ListView<SummaryView<SubTextSecondBasic>>.self, for: indexPath)
            let state = signposterForConfigure.beginInterval(pointOfInterestName)
            result.view.summaryView.configure(title: title, broadcastTime: broadcastTime)
            signposterForConfigure.endInterval(pointOfInterestName, state)
            return result.cell

        case let .noSubTextBasic(title):
            let result = collectionView.reusable.dequeueReusableView(ListView<SummaryView<NoSubTextBasic>>.self, for: indexPath)
            let state = signposterForConfigure.beginInterval(pointOfInterestName)
            result.view.summaryView.configure(title: title)
            signposterForConfigure.endInterval(pointOfInterestName, state)
            return result.cell

        case let .subTextSecondCoin(title, duration, tag, coin):
            let result = collectionView.reusable.dequeueReusableView(ListView<SummaryView<SubTextSecondCoin>>.self, for: indexPath)
            let state = signposterForConfigure.beginInterval(pointOfInterestName)
            result.view.summaryView.configure(title: title, duration: duration, tag: tag, coin: coin)
            signposterForConfigure.endInterval(pointOfInterestName, state)
            return result.cell

        case let .noSubTextCoin(title, coin, expirationTime):
            let result = collectionView.reusable.dequeueReusableView(ListView<SummaryView<NoSubTextCoin>>.self, for: indexPath)
            let state = signposterForConfigure.beginInterval(pointOfInterestName)
            result.view.summaryView.configure(title: title, coin: coin, expirationTime: expirationTime)
            signposterForConfigure.endInterval(pointOfInterestName, state)
            return result.cell

        case let .subTextTopViewingType(seasonName, title, tag, expirationTime):
            let result = collectionView.reusable.dequeueReusableView(ListView<SummaryView<SubTextTopViewingType>>.self, for: indexPath)
            let state = signposterForConfigure.beginInterval(pointOfInterestName)
            result.view.summaryView.configure(seasonName: seasonName, title: title, tag: tag, expirationTime: expirationTime)
            signposterForConfigure.endInterval(pointOfInterestName, state)
            return result.cell

        case let .subTextSecondViewingType(title, broadcastTime, tag, expirationTime):
            let result = collectionView.reusable.dequeueReusableView(ListView<SummaryView<SubTextSecondViewingType>>.self, for: indexPath)
            let state = signposterForConfigure.beginInterval(pointOfInterestName)
            result.view.summaryView.configure(title: title, broadcastTime: broadcastTime, tag: tag, expirationTime: expirationTime)
            signposterForConfigure.endInterval(pointOfInterestName, state)
            return result.cell

        case let .noSubTextViewingType(title, tag, expirationTime):
            let result = collectionView.reusable.dequeueReusableView(ListView<SummaryView<NoSubTextViewingType>>.self, for: indexPath)
            let state = signposterForConfigure.beginInterval(pointOfInterestName)
            result.view.summaryView.configure(title: title, tag: tag, expirationTime: expirationTime)
            signposterForConfigure.endInterval(pointOfInterestName, state)
            return result.cell
        }
    }
}

extension ViewDataModel {
    fileprivate func toStaticString() -> StaticString {
        switch self {
        case .subTextTopBasic:          return "SubTextTop-Basic"
        case .subTextSecondBasic:       return "SubTextSecond-Basic"
        case .noSubTextBasic:           return "NoSubText-Basic"
        case .subTextSecondCoin:        return "SubTextSecond-Coin"
        case .noSubTextCoin:            return "NoSubText-Coin"
        case .subTextTopViewingType:    return "SubTextTop-ViewingType"
        case .subTextSecondViewingType: return "SubTextSecond-ViewingType"
        case .noSubTextViewingType:     return "NoSubText-ViewingType"
        }
    }
}
