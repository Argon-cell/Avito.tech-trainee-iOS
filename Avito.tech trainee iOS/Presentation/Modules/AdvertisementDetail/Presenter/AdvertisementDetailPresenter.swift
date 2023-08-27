//
//  AdvertisementDetailPresenter.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 26.08.2023.
//

import Foundation

final class AdvertisementDetailPresenter {
    
    weak var viewInput: AdvertisementDetailInput?
    private var advertisement: AdvertisementDetail?
    private weak var moduleOutput: AdvertisementDetailModuleOutput?
    
    private let id: String
    private let networkService: NetworkService
    
    init(id: String, networkService: NetworkService,
         moduleOutput: AdvertisementDetailModuleOutput?) {
        self.id = id
        self.networkService = networkService
        self.moduleOutput = moduleOutput
    }
    
    private func loadData() {
        viewInput?.setLoading(enabled: true)
        
        networkService.fetchDetailedAvertisement(id: id) { result in
            switch result {
            case .success(let advertisementDetail):
                let convertedAdvertisementDetail = AdvertisementDetail(from: advertisementDetail)
                self.advertisement = convertedAdvertisementDetail
                self.updateDisplayedData(convertedAdvertisementDetail)
                self.viewInput?.setLoading(enabled: false)
            case .failure(let error):
                self.viewInput?.showAlert(with: error.localizedDescription)
            }
        }
    }
    
    private func reloadData() {
        loadData()
    }

    private func updateDisplayedData(_ data: AdvertisementDetail) {
        viewInput?.showData(data)
    }
}

extension AdvertisementDetailPresenter: AdvertisementDetailOutput {
    func viewIsReady() {
        loadData()
    }
    
    func reload() {
        reloadData()
    }
    
    func load() {
        loadData()
    }
}
