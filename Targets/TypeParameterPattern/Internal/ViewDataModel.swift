//
//  ViewDataModel.swift
//  
//
//  Created by marty-suzuki on 2022/08/09.
//

import Common

public enum ViewDataModel: Hashable {

    // MARK: - Basic

    case subTextTopBasic(startAt: String, title: String)
    case subTextSecondBasic(title: String, broadcastTime: String)
    case noSubTextBasic(title: String)

    // MARK: - Coin

    case subTextSecondCoin(title: String, duration: String, tag: Tag?, coin: Int?)
    case noSubTextCoin(title: String, coin: Int?, expirationTime: String?)

    // MARK: - ViewingType

    case subTextTopViewingType(seasonName: String, title: String, tag: Tag?, expirationTime: String?)
    case subTextSecondViewingType(title: String, broadcastTime: String, tag: Tag?, expirationTime: String?)
    case noSubTextViewingType(title: String, tag: Tag?, expirationTime: String?)
}
