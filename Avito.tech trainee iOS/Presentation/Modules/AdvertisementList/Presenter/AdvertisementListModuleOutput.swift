//
//  AdvertisementListModuleOutput.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 26.08.2023.
//

import Foundation

protocol AdvertisementListModuleOutput: AnyObject {
    func moduleWantsToOpenDetails(with id: String)
}
