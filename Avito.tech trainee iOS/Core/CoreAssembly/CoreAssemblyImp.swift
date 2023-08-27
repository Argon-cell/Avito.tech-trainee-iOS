//
//  CoreAssemblyImp.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 26.08.2023.
//

import Foundation

final class CoreAssemblyImp: CoreAssembly {
    func makeNetwork() -> NetworkService {
        let urlSession = URLSession(configuration: .default)
        let networkClient = NetworkClientImp(urlSession: urlSession)
        
        return NetworkServiceImp(networkClient: networkClient)
    }
}
