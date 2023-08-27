//
//  AdvertisementListPresenter.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 26.08.2023.
//

import Foundation

final class AdvertisementListPresenter {
    
    weak var viewInput: AdvertisementListInput?

    private var advertisements = [Advertisement]()
    
    private let networkService: NetworkService
    private weak var moduleOutput: AdvertisementListModuleOutput?
    
    init(networkService: NetworkService,
         moduleOutput: AdvertisementListModuleOutput?) {
        self.networkService = networkService
        self.moduleOutput = moduleOutput
        loadData()
    }
    
    private func loadData() {
        viewInput?.setLoading(enabled: true)
        
        networkService.fetchAvertisements({ result in
            switch result {
            case .success(let advertisements):
                self.advertisements = advertisements.advertisements.map({ Advertisement(from: $0)})
                self.updateDisplayedData()
                self.viewInput?.setLoading(enabled: false)
            case .failure(let error):
                self.viewInput?.showAlert(with: error.localizedDescription)
            }
        })
    }
    
    private func reloadData() {
        loadData()
    }

    private func updateDisplayedData() {
        viewInput?.showData()
    }
}

extension AdvertisementListPresenter: AdvertisementListOutput {
    func itemForCell(at index: Int) -> Advertisement {
        advertisements[index]
    }
    
    func getCountItems() -> Int {
        advertisements.count
    }
    
    func viewIsReady() {
        loadData()
    }
    
    func reload() {
        reloadData()
    }
    
    func didSelectItem(at index: Int) {
        guard advertisements.indices.contains(index) else {
            return
        }
        let selectedItem = advertisements[index]
        moduleOutput?.moduleWantsToOpenDetails(with: selectedItem.id)
    }
}
