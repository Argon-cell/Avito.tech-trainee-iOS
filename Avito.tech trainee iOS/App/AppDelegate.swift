//
//  AppDelegate.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 24.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: Coordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // MARK: - Initial setup
        let networkService = CoreAssemblyImp().makeNetwork()
        
        // MARK: - Window setup
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        coordinator = CoordinatorImp(advertisementListAssembly: AdvertisementListAssemblyImp(networkService: networkService), advertisementDetailAssembly: AdvertisementDetailAssemblyImp(networkService: networkService))
        coordinator?.start(in: window)
        
        return true
    }
}

