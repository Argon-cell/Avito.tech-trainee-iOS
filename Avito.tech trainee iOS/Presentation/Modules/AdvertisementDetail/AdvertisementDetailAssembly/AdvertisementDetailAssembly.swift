//
//  AdvertisementDetailAssembly.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 26.08.2023.
//

import Foundation
import UIKit

protocol AdvertisementDetailAssembly {
    func makeAdvertisementDetailModule(_ id: String) -> UIViewController
}
