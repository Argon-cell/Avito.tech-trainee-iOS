//
//  AdvertisementDetailInput.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 26.08.2023.
//

import Foundation

protocol AdvertisementDetailInput: AnyObject {
    func setLoading(enabled: Bool)
    func showData(_ data: AdvertisementDetail)
    func showAlert(with errorMessage: String)
}
