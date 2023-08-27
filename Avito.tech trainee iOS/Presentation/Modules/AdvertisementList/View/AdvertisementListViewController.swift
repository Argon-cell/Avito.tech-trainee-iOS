//
//  AdvertisementCollectionViewController.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 24.08.2023.
//

import Foundation
import UIKit

class AdvertisementListViewController: UIViewController {
    //MARK: - Vars
    private var collectionView: UICollectionView!
    private lazy var activityIndicator = UIActivityIndicatorView(style: .medium)
    
    private let presenter: AdvertisementListOutput
    
    //MARK: - Inits
    init(presenter: AdvertisementListOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout:  createLayout())
        collectionView.backgroundColor = UIColor(named: "PrimaryBack")

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AdvertisementCollectionViewCell.self, forCellWithReuseIdentifier: Constants.cellId)
        
        activityIndicator.color = UIColor(named: "PrimaryLabel")
        
        addSubViews()
        setupLayout()
        presenter.viewIsReady()
    }
    
    // MARK: - Private methods
    private func addSubViews() {
        view.addSubview(collectionView)
        view.addSubview(activityIndicator)
    }
    
    private func setupLayout() {
        activityIndicator.center = view.center
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(300))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    @objc private func tapCell(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: location)
        if let indexPath = indexPath {
            presenter.didSelectItem(at: indexPath.row)
        }
    }
}

extension AdvertisementListViewController: AdvertisementListInput {
    func setLoading(enabled: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if enabled {
                self.activityIndicator.startAnimating()
            } else {
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    func showData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            collectionView.reloadData()
        }
    }
    
    func showAlert(with errorMessage: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let retryAction = UIAlertAction(title: Constants.reloadLabel, style: .destructive) { _ in
                self.presenter.reload()
            }
            let okAction = UIAlertAction(title: Constants.okLabel, style: .default) { _ in }
            let alertViewController = UIAlertController(title: Constants.errorLabel, message: errorMessage, preferredStyle: .alert)
            alertViewController.addAction(okAction)
            alertViewController.addAction(retryAction)
            self.present(alertViewController, animated: true)
        }
    }
}

extension AdvertisementListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellId, for: indexPath) as! AdvertisementCollectionViewCell
        
        collectionViewCell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCell(_:))))
        collectionViewCell.updateCell(presenter.itemForCell(at: indexPath.row))
        return collectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getCountItems()
    }
    
    // MARK: - Animations
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.2) {
            cell?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.2) {
            cell?.transform = .identity
        }
    }
}

extension AdvertisementListViewController {
    enum Constants {
        static let cellId = "advertisementCell"
        static let reloadLabel = "Попробовать снова"
        static let okLabel = "Ок"
        static let errorLabel = "Ошибочка"
    }
}
