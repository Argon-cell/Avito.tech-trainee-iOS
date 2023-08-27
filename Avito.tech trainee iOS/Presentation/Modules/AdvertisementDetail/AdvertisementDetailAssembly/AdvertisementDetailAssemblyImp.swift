//
//  AdvertisementDetailAssemblyImp.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 26.08.2023.
//

import Foundation
import UIKit

final class AdvertisementDetailAssemblyImp: AdvertisementDetailAssembly {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func makeAdvertisementDetailModule(_ id: String) -> UIViewController {
        let presenter = AdvertisementDetailPresenter(id: id, networkService: networkService, moduleOutput: nil)
        let vc = AdvertisementDetailViewController(presenter: presenter)
        presenter.viewInput = vc

        return vc
    }
    
}
