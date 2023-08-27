//
//  NetworkServiceImp.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 24.08.2023.
//

import Foundation

final class NetworkServiceImp: NetworkService {
    // MARK: - Properties
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    // MARK: - Public
    func fetchAvertisements(_ completion: @escaping (Result<AdvertisementsDTO, Error>) -> ()) {
        networkClient.processRequest(request: getAdvertisementsRequest(), completion: completion)
    }
    
    func fetchDetailedAvertisement(id: String, _ completion: @escaping (Result<AdvertisementDetailDTO, Error>) -> ()) {
        networkClient.processRequest(request: getDetailedAdvertisementRequest(id: id), completion: completion)
    }
    
    func fetchImageData(url: URL, _ completion: @escaping (Result<Data?, Error>) -> ()) {
        networkClient.processRequest(request: getFetchImageData(url: url), completion: completion)
    }

    // MARK: - Private
    private func getFetchImageData(url: URL) -> HTTPRequest {
        HTTPRequest(route: url.absoluteString)
    }
    
    private func getAdvertisementsRequest() -> HTTPRequest {
        HTTPRequest(route: NetworkServiceImp.Constants.advertisementsPage)
    }
    
    private func getDetailedAdvertisementRequest(id: String) -> HTTPRequest {
        return HTTPRequest(route: NetworkServiceImp.Constants.detaildAdvertisementPage(id: id))
    }
}

// MARK: - Nested types
extension NetworkServiceImp {
    enum Constants {
        static let baseurl: String = "https://www.avito.st/s/interns-ios/"
        static let advertisementsPage: String = baseurl + "main-page.json"
        static func detaildAdvertisementPage(id: String) -> String { baseurl + "details/\(id).json" }
    }
}
