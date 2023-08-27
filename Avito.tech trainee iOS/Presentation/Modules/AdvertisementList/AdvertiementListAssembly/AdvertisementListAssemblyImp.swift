//
//  AdvertisementListAssemblyImp.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 26.08.2023.
//

import Foundation
import UIKit

final class AdvertisementListAssemblyImp: AdvertisementListAssembly {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func makeAdvertisementListModule(moduleOutput: AdvertisementListModuleOutput) -> UIViewController {
        let presenter = AdvertisementListPresenter(networkService: networkService, moduleOutput: moduleOutput)
        let vc = AdvertisementListViewController(presenter: presenter)
        presenter.viewInput = vc

        return vc
    }
    
}
