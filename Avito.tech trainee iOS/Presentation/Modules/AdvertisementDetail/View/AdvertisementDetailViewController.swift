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
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "SecondaryLabel")
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
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

        
        let exportButton = UIButton()
        exportButton.setImage(UIImage(named: "ExportIcon")?.withTintColor(UIColor(named: "PrimaryLabel")!, renderingMode: .alwaysOriginal), for: .normal)
        exportButton.frame.size = CGSize(width: 32, height: 24)
        let exportBarButton = UIBarButtonItem(customView: exportButton)
        
        let likeButton = UIButton()
        likeButton.setImage(UIImage(named: "HeartIcon")?.withTintColor(UIColor(named: "PrimaryLabel")!, renderingMode: .alwaysOriginal), for: .normal)
        likeButton.frame.size = CGSize(width: 32, height: 24)
        let likeBarButton = UIBarButtonItem(customView: likeButton)
        
        let cartButton = UIButton()
        cartButton.setImage(UIImage(named: "CartIcon")?.withTintColor(UIColor(named: "PrimaryLabel")!, renderingMode: .alwaysOriginal), for: .normal)
        cartButton.frame.size = CGSize(width: 32, height: 24)
        let cartBarButton = UIBarButtonItem(customView: cartButton)

        
        navigationItem.rightBarButtonItems = [cartBarButton, likeBarButton, exportBarButton]
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true

        activityIndicator.color = UIColor(named: "PrimaryLabel")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "PrimaryBack")
        
        addSubViews()
        setupLayout()
        
        presenter.viewIsReady()
    }
    
    private func addSubViews() {
        view.addSubview(scrollView)
        view.addSubview(activityIndicator)
        
        scrollView.addSubview(imageView)
        scrollView.addSubview(priceLabel)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(placeLabel)
        scrollView.addSubview(descriptionTitleLabel)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(contactsTitleLabel)
        scrollView.addSubview(phoneLabel)
        scrollView.addSubview(emailLabel)
        scrollView.addSubview(idLabel)
        scrollView.addSubview(dateLabel)
    }
    
    private func setupLayout() {
        activityIndicator.center = view.center
    
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.contentSize = view.bounds.size
        
        imageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.0).isActive = true

        priceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true

        placeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        placeLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        placeLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true

        descriptionTitleLabel.topAnchor.constraint(equalTo: placeLabel.bottomAnchor, constant: 16).isActive = true
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
        
        idLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 16).isActive = true
        idLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        idLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        
        
        dateLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 4).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
    }
    
    @objc private func backPressed(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }

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
            self.dateLabel.text = data.createdDate.localizedDateString(with: "yyyy-MM-dd")
            self.descriptionLabel.text = data.description
            self.phoneLabel.text = data.phoneNumber
            self.emailLabel.text = data.email
            self.idLabel.text = "Обьявление №" + data.id
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
