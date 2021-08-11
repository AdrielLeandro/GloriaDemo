//
//  TapBarViewControllers.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 8/08/21.
//

import UIKit

class FirstViewController: UIViewController {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = LocalizableStrings.contactTitle
        label.font = .openSansBoldFontSize24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

class SecondViewController: UIViewController {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = LocalizableStrings.moreTitle
        label.font = .openSansBoldFontSize24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

