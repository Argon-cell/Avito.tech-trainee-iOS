//
//  NetworkService.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 24.08.2023.
//

import Foundation

protocol NetworkService: AnyObject {
    func fetchAvertisements(_ completion: @escaping (Result<AdvertisementsDTO, Error>) -> ())
    func fetchDetailedAvertisement(id: String, _ completion: @escaping (Result<AdvertisementDetailDTO, Error>) -> ())
    func fetchImageData(url: URL, _ completion: @escaping (Result<Data?, Error>) -> ())
}
