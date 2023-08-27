//
//  AdvertisementDetailViewController.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 25.08.2023.
//

import UIKit
import Combine

class AdvertisementDetailViewController: UIViewController {
    //MARK: - Properties    
    private lazy var activityIndicator = UIActivityIndicatorView(style: .medium)
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "PrimaryLabel")
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "PrimaryLabel")
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = .max
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var placeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "PrimaryLabel")
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = .max
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "SecondaryLabel")
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.numberOfLines = .max
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание"
        label.textColor = UIColor(named: "PrimaryLabel")
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "PrimaryLabel")
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .max
        
        return label
    }()
    
    private lazy var contactsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Контакты"
        label.textColor = UIColor(named: "PrimaryLabel")
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "PrimaryLabel")
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .max
        
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "PrimaryLabel")
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .max
        
        return label
    }()
    
    private lazy var imageView: WebImageView = {
        let imageView = WebImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor(named: "SecondaryBack")
        imageView.frame.size = CGSize(width: UIScreen.main.bounds.width, height: 150)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let presenter: AdvertisementDetailPresenter

    init(presenter: AdvertisementDetailPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "arrow.left")?.withTintColor(UIColor(named: "PrimaryLabel")!, renderingMode: .alwaysOriginal), target: self, action: #selector(backPressed))
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true

        activityIndicator.color = UIColor(named: "PrimaryLabel")
        activityIndicator.startAnimating()
        
        addSubViews()
        setupLayout()
        hideUI()
        presenter.viewIsReady()
    }
    
//    func loadData() {
//        networkService.fetchDetailedAvertisement(id: advertisementId, { result in
//            switch result {
//            case .success(let success):
//                self.advertisement = AdvertisementDetail(from: success)
//                self.titleLabel.text = self.advertisement!.title
//                self.priceLabel.text = self.advertisement!.price
//                self.placeLabel.text = self.advertisement!.location + ", " + (self.advertisement?.address ?? "")
//                self.dateLabel.text = self.advertisement!.createdDate
//                self.descriptionLabel.text = self.advertisement!.description
//                self.phoneLabel.text = self.advertisement!.phoneNumber
//                self.emailLabel.text = self.advertisement!.email
//
//                self.imageView.loadImage(url: URL(string: self.advertisement!.imageUrl)!)
//                self.state = .content
//            case .failure(let failure):
//                print(failure)
//            }
//        })
//    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "PrimaryBack")
        
    }
    
    private func addSubViews() {
        self.view.addSubview(scrollView)
        self.view.addSubview(activityIndicator)
        
        scrollView.addSubview(imageView)
        scrollView.addSubview(priceLabel)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(placeLabel)
        scrollView.addSubview(dateLabel)
        scrollView.addSubview(descriptionTitleLabel)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(contactsTitleLabel)
        scrollView.addSubview(phoneLabel)
        scrollView.addSubview(emailLabel)
    }
    
    private func setupLayout() {
        activityIndicator.center = view.center
    
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor).isActive = true
        scrollView.contentSize = view.bounds.size
        
        imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.0).isActive = true

        priceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true

        placeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        placeLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        placeLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true

        dateLabel.topAnchor.constraint(equalTo: placeLabel.bottomAnchor, constant: 4).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        
        descriptionTitleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16).isActive = true
        descriptionTitleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        descriptionTitleLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        
        contactsTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        contactsTitleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        contactsTitleLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        
        phoneLabel.topAnchor.constraint(equalTo: contactsTitleLabel.bottomAnchor, constant: 8).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        phoneLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true

        emailLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 8).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        emailLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        emailLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    
    }
    
    @objc private func backPressed(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }

    
//    func updateUI() {
//        switch state {
//            case .loading:
//                activityIndicator.startAnimating()
//                hideUI()
//                loadData()
//
//            case .content:
//                activityIndicator.stopAnimating()
//                showUI()
//
//            case .error(let message):
//                // Показываем сообщение об ошибке
//                let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//                alert.addAction(okAction)
//                present(alert, animated: true, completion: nil)
//        }
//    }
    
    private func hideUI() {
        imageView.isHidden = true
        contactsTitleLabel.isHidden = true
        descriptionTitleLabel.isHidden = true
    }
    
    private func showUI() {
        imageView.isHidden = false
        contactsTitleLabel.isHidden = false
        descriptionTitleLabel.isHidden = false
    }

}

extension AdvertisementDetailViewController: AdvertisementDetailInput {
    func setLoading(enabled: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if enabled {
                hideUI()
                self.activityIndicator.startAnimating()
            } else {
                showUI()
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    func showData(_ data: AdvertisementDetail) {
        DispatchQueue.main.async {
            self.titleLabel.text = data.title
            self.priceLabel.text = data.price
            self.placeLabel.text = data.location + ", " + data.address
            self.dateLabel.text = data.createdDate
            self.descriptionLabel.text = data.description
            self.phoneLabel.text = data.phoneNumber
            self.emailLabel.text = data.email
        }
        if let url = URL(string: data.imageUrl) {
            self.imageView.loadImage(url: url)
        }
    }
    
    func showAlert(with errorMessage: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let retryAction = UIAlertAction(title: AdvertisementListViewController.Constants.reloadLabel, style: .destructive) { _ in
                self.presenter.reload()
            }
            let okAction = UIAlertAction(title:  AdvertisementListViewController.Constants.okLabel, style: .default) { _ in }
            let alertViewController = UIAlertController(title:  AdvertisementListViewController.Constants.errorLabel, message: errorMessage, preferredStyle: .alert)
            alertViewController.addAction(okAction)
            alertViewController.addAction(retryAction)
            self.present(alertViewController, animated: true)
        }
    }
}
