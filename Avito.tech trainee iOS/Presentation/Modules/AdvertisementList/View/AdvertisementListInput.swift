//
//  AdvertisementListInput.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 26.08.2023.
//

import Foundation

protocol AdvertisementListInput: AnyObject {
    func setLoading(enabled: Bool)
    func showData()
    func showAlert(with errorMessage: String)
}
