//
//  AdvertisementListOutput.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 26.08.2023.
//

import Foundation

protocol AdvertisementListOutput: AnyObject {
    func viewIsReady()
    func reload()
    func didSelectItem(at index: Int)
    func itemForCell(at index: Int) -> Advertisement
    func getCountItems() -> Int
}
