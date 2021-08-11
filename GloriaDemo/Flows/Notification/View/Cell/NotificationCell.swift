//
//  NotificationCell.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 8/08/21.
//

import UIKit

class NotificationCell: UITableViewCell, CellProtocol {
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = .openSansRegularFontSize15()
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var notificationPointerView: UIView = {
        let view = UIView()
        view.backgroundColor = .candy
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profile-icon"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        initialSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: NotificationCellViewModel) {
        messageLabel.attributedText = viewModel.notification.text.highlight(text: viewModel.notification.highlightText,
                                                                  font: Font().setFontFamily(fontFamily: .openSans).setSize(fontSize: .medium))
        if let photo = viewModel.notification.photo {
            photoImageView.image = UIImage(named: photo)
        }
        notificationPointerView.isHidden = viewModel.notification.status
        photoImageView.widthAnchor.constraint(equalToConstant: viewModel.notification.notificationType == .message ? 40 : 48).isActive = true
        
        viewModel.didShowNotification = { [weak self] status in
            self?.notificationPointerView.isHidden = status
        }
    }
    
    private func initialSetup() {
        setupPointerView()
        setupLabel()
        setupImageView()
        setupSeparatonlineView()
    }

    private func setupPointerView() {
        addSubview(notificationPointerView)
        NSLayoutConstraint.activate([
            notificationPointerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            notificationPointerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            notificationPointerView.heightAnchor.constraint(equalToConstant: 8),
            notificationPointerView.widthAnchor.constraint(equalToConstant: 8)
        ])
    }
    
    private func setupLabel() {
        addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: notificationPointerView.trailingAnchor, constant: 12),
        ])
    }
    
    private func setupImageView() {
        addSubview(photoImageView)
        NSLayoutConstraint.activate([
            photoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            photoImageView.heightAnchor.constraint(equalToConstant: 48),
            photoImageView.leadingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)
        ])
    }
    
    private func setupSeparatonlineView() {
        addSubview(separatorLineView)
        NSLayoutConstraint.activate([
            separatorLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            separatorLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            separatorLineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
