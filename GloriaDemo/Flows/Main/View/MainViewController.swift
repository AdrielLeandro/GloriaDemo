//
//  MainController.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 7/08/21.
//

import UIKit

class MainViewController: UITabBarController {
    private let viewModel: MainViewModel
    
    private lazy var customTabBar: CustomTabBar = {
        let tabBar: CustomTabBar = CustomTabBar.fromNib()
        tabBar.frame = CGRect(x: 0, y: view.bounds.height - 50, width: view.bounds.width, height: 50)
        tabBar.delegate = self
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        viewControllers = [FirstViewController(), SecondViewController()]
        return tabBar
    }()
    
    private lazy var middleButton: UIButton = {
        let button = UIButton(frame: CGRect(x: (view.bounds.width / 2) - 25, y: -20, width: 50, height: 50))
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 25
        let image = UIImage(named: "notification-icon")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .gray
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.addTarget(self, action: #selector(didTouchMiddleButton), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        delegate = self
        setupCustomTabBar()
    }
    
    private func setupCustomTabBar() {
        let firstItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        let secondItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        customTabBar.items = [firstItem, secondItem]
        customTabBar.selectedItem = firstItem
        view.addSubview(customTabBar)
        customTabBar.addSubview(middleButton)
    }
    
    @objc private func didTouchMiddleButton(sender: UIButton) {
        viewModel.didTouchNotificationButton()
    }
}

extension MainViewController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            selectedIndex = 0
        } else {
            selectedIndex = 1
        }
    }
}

