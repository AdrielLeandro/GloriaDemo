//
//  NotificationViewController.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 8/08/21.
//

import UIKit

class NotificationViewController: CustomViewController {
    private let viewModel: NotificationViewModel

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.rowHeight = 64
        tableView.register(NotificationCell.self, forCellReuseIdentifier: NotificationCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    init(viewModel: NotificationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRightBarButton(type: .close, action: #selector(didTouchClose))
        setCustomNavigation(title: LocalizableStrings.notificationTitle.uppercased())
        setupTableView()
        setupViewModel()
    }
    
    @objc private func didTouchClose() {
        viewModel.didTouchClose()
    }
    
    private func setupViewModel() {
        viewModel.didSuccess = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.getNotifications()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: customNavigationView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension NotificationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NotificationCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(with: viewModel.getViewModel(from: indexPath))
        return cell
    }
}

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = viewModel.getViewModel(from: indexPath)
        viewModel.didSelectRowAt(indexPath: indexPath)
        cellViewModel.didShowNotification?(true)
    }
}
