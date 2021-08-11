//
//  CustomViewController.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 10/08/21.
//

import UIKit

class CustomViewController: UIViewController {
    
    lazy var customNavigationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.openSansBoldFontSize24()
        return label
    }()
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.imageView?.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        whiteNavigationBar()
        setupCustomNavigation()
    }
        
    func setupCustomNavigation() {
        view.addSubview(customNavigationView)
        customNavigationView.addSubview(lineView)
        NSLayoutConstraint.activate([
            customNavigationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customNavigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavigationView.heightAnchor.constraint(equalToConstant: 60),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.leadingAnchor.constraint(equalTo: customNavigationView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: customNavigationView.trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: customNavigationView.bottomAnchor)
        ])
    }
    
    func setCustomNavigation(title: String, leftMargin: CGFloat = 24) {
        titleLabel.text = title
        customNavigationView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: customNavigationView.leadingAnchor, constant: leftMargin),
            titleLabel.centerYAnchor.constraint(equalTo: customNavigationView.centerYAnchor)
        ])
    }
}

extension CustomViewController {
    func setupRightBarButton(type: PYBarButtonType, action: Selector) {
        setupBarButton(position: .right, type: type, action: action)
    }

    func setupLeftBarButton(type: PYBarButtonType, action: Selector) {
        setupBarButton(position: .left, type: type, action: action)
    }
    
    private func setupBarButton(position: PYBarButtonPosition, type: PYBarButtonType, action: Selector) {
        button.setImage(type.image, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        customNavigationView.addSubview(button)

        switch position {
        case .left:
            NSLayoutConstraint.activate([
                button.leftAnchor.constraint(equalTo: customNavigationView.leftAnchor,
                                                 constant: 24),
                button.centerYAnchor.constraint(equalTo: customNavigationView.centerYAnchor),
                button.heightAnchor.constraint(equalToConstant: 24),
                button.widthAnchor.constraint(equalToConstant: 24)
            ])
        case .right:
            NSLayoutConstraint.activate([
                button.rightAnchor.constraint(equalTo: customNavigationView.rightAnchor,
                                                 constant: -24),
                button.centerYAnchor.constraint(equalTo: customNavigationView.centerYAnchor),
                button.heightAnchor.constraint(equalToConstant: 24),
                button.widthAnchor.constraint(equalToConstant: 24)
            ])
        }
    }
    enum PYBarButtonPosition: Int {
        case left
        case right
    }

    enum PYBarButtonType: Int {
        case back
        case close
        
        var image: UIImage? {
            switch self {
            case .back:
                return UIImage(named: "back-arrow")
            case .close:
                return UIImage(named: "close-x")
            }
        }
    }
}
