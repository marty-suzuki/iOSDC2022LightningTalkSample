//
//  UIColorExtension.swift
//
//
//  Created by marty-suzuki on 2022/08/09.
//

import UIKit

extension UIColor {

    public static var smokeBasic: UIColor {
        UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
    }

    public static var coin: UIColor {
        UIColor(red: 230/255, green: 195/255, blue: 0, alpha: 1)
    }

    public static var anotherYellow: UIColor {
        UIColor(red: 221/255, green: 170/255, blue: 0, alpha: 1)
    }

    public static var secondaryBlack: UIColor {
        UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
    }

    public static var lightBasic: UIColor {
        UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
    }

    public static var anotherRed: UIColor {
        UIColor(red: 240/255, green: 16/255, blue: 58/255, alpha: 1)
    }

    public static var whiteOpacity12: UIColor {
        UIColor.white.withAlphaComponent(0.12)
    }

    public static var whiteOpacity40: UIColor {
        UIColor.white.withAlphaComponent(0.4)
    }
}
