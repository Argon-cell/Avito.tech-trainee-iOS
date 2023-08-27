//
//  CoordinatorImp.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 26.08.2023.
//

import Foundation
import UIKit

final class CoordinatorImp: Coordinator {
    private weak var window: UIWindow?
    
    private let advertisementListAssembly: AdvertisementListAssembly
    private let advertisementDetailAssembly: AdvertisementDetailAssembly
    
    private var navigationController: UINavigationController?

    init(advertisementListAssembly: AdvertisementListAssembly, advertisementDetailAssembly: AdvertisementDetailAssembly) {
        self.advertisementListAssembly = advertisementListAssembly
        self.advertisementDetailAssembly = advertisementDetailAssembly
    }

    func start(in window: UIWindow) {        
        let vc = advertisementListAssembly.makeAdvertisementListModule(moduleOutput: self)
        self.navigationController = UINavigationController(rootViewController: vc)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
    
}

extension CoordinatorImp: AdvertisementListModuleOutput {
    func moduleWantsToOpenDetails(with id: String) {
        let vc = advertisementDetailAssembly.makeAdvertisementDetailModule(id)
        navigationController?.pushViewController(vc, animated: true)
    }
}
