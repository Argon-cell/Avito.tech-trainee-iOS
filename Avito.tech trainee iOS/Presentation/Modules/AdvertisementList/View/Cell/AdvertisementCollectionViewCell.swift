//
//  AdvertisementCollectionViewCell.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 24.08.2023.
//

import Foundation
import UIKit

class AdvertisementCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "PrimaryLabel")
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "PrimaryLabel")
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var placeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "SecondaryLabel")
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "SecondaryLabel")
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageView: WebImageView = {
        let imageView = WebImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor(named: "SecondaryBack")
        imageView.layer.cornerRadius = 8
        imageView.frame.size = CGSize(width: 150, height: 150)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    func updateCell(_ advertisement: Advertisement) {
        titleLabel.text = advertisement.title
        priceLabel.text = advertisement.price
        placeLabel.text = advertisement.location
        dateLabel.text = advertisement.createdDate.localizedDateString(with: "yyyy-MM-dd")
        if let url = URL(string: advertisement.imageUrl) {
            imageView.loadImage(url: url)
        }
    }
    
    // MARK: - Override methods
    override func prepareForReuse() {
        titleLabel.text = ""
        priceLabel.text = ""
        placeLabel.text = ""
        dateLabel.text = ""
        imageView.image = nil
    }
    
    //MARK: - Private methods
    private func addSubViews(){
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(placeLabel)
        contentView.addSubview(dateLabel)
    }
    
    private func setupConstraints() {
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.0).isActive = true

        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

        placeLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8).isActive = true
        placeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        placeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

        dateLabel.topAnchor.constraint(equalTo: placeLabel.bottomAnchor, constant: 4).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
}



