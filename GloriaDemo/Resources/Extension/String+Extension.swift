//
//  String+Extension.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 9/08/21.
//

import UIKit

extension String {
    func highlight(text: String, font: Font) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self,
                                                         attributes: [NSAttributedString.Key.font: font.builder()])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font.setWeight(weight: .bold).builder()]
        let range = (self as NSString).range(of: text)
        attributedString.addAttributes(boldFontAttribute, range: range)
        return attributedString
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    func localizedFormat(_ arguments: CVarArg...) -> String {
        return String(format: localized, arguments: arguments)
    }

    func localizedFormat(arguments: CVarArg..., using tableName: String?, in bundle: Bundle?) -> String {
        return String(format: localized, arguments: arguments)
    }
}
