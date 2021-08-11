//
//  Font.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 8/08/21.
//

import UIKit

class Font {
    private var fontFamily: FontFamily = .openSans
    private var fontSize: StandardSize = .medium
    private var weight: Weight = .regular

    @discardableResult
    func setFontFamily(fontFamily: FontFamily) -> Font {
        self.fontFamily = fontFamily
        return self
    }

    @discardableResult
    func setSize(fontSize: StandardSize) -> Font {
        self.fontSize = fontSize
        return self
    }

    @discardableResult
    func setWeight(weight: Weight) -> Font {
        self.weight = weight
        return self
    }

    func builder() -> UIFont {
        switch fontFamily {
        case .system: return getSystemFont()
        case .openSans: return getInstalledFont()
        }
    }

    private func getInstalledFont() -> UIFont {
        return UIFont(name: fontFamily.fontName(weight: weight), size: fontSize.rawValue) ?? getSystemFont()
    }

    private func getSystemFont() -> UIFont {
        switch weight {
        case .light:
            return UIFont.systemFont(ofSize: fontSize.rawValue, weight: UIFont.Weight.light)
        case .regular:
            return UIFont.systemFont(ofSize: fontSize.rawValue, weight: UIFont.Weight.regular)
        case .semibold:
            return UIFont.systemFont(ofSize: fontSize.rawValue, weight: UIFont.Weight.semibold)
        case .bold:
            return UIFont.systemFont(ofSize: fontSize.rawValue, weight: UIFont.Weight.bold)
        case .semiBold:
            return UIFont.systemFont(ofSize: fontSize.rawValue, weight: UIFont.Weight.semibold)
        }
    }

    enum FontFamily {
        case openSans
        case system

        func fontName(weight: Weight) -> String {
            switch self {
            case .openSans: return "OpenSans\(weight.rawValue)"
            case .system: return ""
            }
        }
    }

    enum Weight: String {
        case light = "-Light"
        case regular = "-Regular"
        case semibold = "-Black"
        case bold = "-Bold"
        case semiBold = "-SemiBold"
        
    }

    enum StandardSize: CGFloat {
        case extraSmall = 10
        case small = 12
        case medium = 15
        case large = 17
        case extraLarge = 20
        case superLarge = 24
        case hyperLarge = 50
    }
}

extension UIFont {
    static func openSansRegularFontSize15() -> UIFont {
        return Font().setFontFamily(fontFamily: .openSans)
            .setSize(fontSize: .medium)
            .setWeight(weight: .regular).builder()
    }
    static func openSansBoldFontSize15() -> UIFont {
        return Font().setFontFamily(fontFamily: .openSans)
            .setSize(fontSize: .medium)
            .setWeight(weight: .bold).builder()
    }
    static func openSansBoldFontSize17() -> UIFont {
        return Font().setFontFamily(fontFamily: .openSans)
            .setSize(fontSize: .large)
            .setWeight(weight: .regular).builder()
    }
    static func openSansBoldFontSize24() -> UIFont {
        return Font().setFontFamily(fontFamily: .openSans)
            .setSize(fontSize: .superLarge)
            .setWeight(weight: .semibold).builder()
    }
}
