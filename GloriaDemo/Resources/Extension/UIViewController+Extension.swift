//
//  UIViewController+Extension.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 9/08/21.
//

import UIKit

extension UIViewController {
        
    func whiteNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .white
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
    }
}
