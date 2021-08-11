//
//  ProfileViewController.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 9/08/21.
//

import UIKit

class ProfileViewController: CustomViewController {
    private let viewModel: ProfileViewModel
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: (view.bounds.width / 2) - 14, height: 248)
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionViewLayout.minimumInteritemSpacing = 7
        collectionViewLayout.minimumLineSpacing = 7
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 64
        return imageView
    }()
    
    private lazy var resumeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.addArrangedSubview(videosLabel)
        stackView.addArrangedSubview(followersLabel)
        stackView.addArrangedSubview(followinsLabel)

        return stackView
    }()
    
    private lazy var videosLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .openSansBoldFontSize17()
        return label
    }()
    
    private lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .openSansBoldFontSize17()
        return label
    }()
    
    private lazy var followinsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .openSansBoldFontSize17()
        return label
    }()
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLeftBarButton(type: .back, action: #selector(didTouchBack))
        setupImageView()
        setupStackView()
        setupCollectionView()
        setupViewModel()
    }
    
    @objc private func didTouchBack() {
        viewModel.didTouchBack()
    }
    
    private func setupViewModel() {
        viewModel.didSuccess = { [weak self] profile in
            self?.setCustomNavigation(title: profile.name, leftMargin: 56)
            self?.profileImageView.image = UIImage(named: profile.photo ?? "")
            self?.videosLabel.text = LocalizableStrings.profileNumberVideos.localizedFormat(profile.numberVideos)
            self?.followersLabel.text = LocalizableStrings.profileNumberFollowers.localizedFormat(profile.numberFollowers)
            self?.followinsLabel.text = LocalizableStrings.profileNumberFollowings.localizedFormat(profile.numberFollowings)
        }
        viewModel.getProfile()
    }
    
    private func setupImageView() {
        view.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: customNavigationView.bottomAnchor, constant: 24)
        ])
    }
    
    private func setupStackView() {
        view.addSubview(resumeStackView)
        NSLayoutConstraint.activate([
            resumeStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            resumeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: resumeStackView.bottomAnchor, constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ItemCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        return cell
    }
}
