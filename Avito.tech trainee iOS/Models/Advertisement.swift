//
//  Advertisement.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 24.08.2023.
//

import Foundation

struct Advertisement {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageUrl: String
    let createdDate: String
    
    init(from dto: AdvertisementDTO) {
        self.id = dto.id
        self.title = dto.title
        self.price = dto.price
        self.location = dto.location
        self.imageUrl = dto.imageUrl
        self.createdDate = dto.createdDate
    }
}

// MARK: - Dto model

struct AdvertisementDTO: Decodable {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageUrl: String
    let createdDate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case location
        case imageUrl = "image_url"
        case createdDate = "created_date"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.price = try container.decode(String.self, forKey: .price)
        self.location = try container.decode(String.self, forKey: .location)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        self.createdDate = try container.decode(String.self, forKey: .createdDate)
    }
}

struct AdvertisementsDTO: Decodable {
    let advertisements: [AdvertisementDTO]
    
    enum CodingKeys: String, CodingKey {
        case advertisements
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.advertisements = try container.decode([AdvertisementDTO].self, forKey: .advertisements)
    }
}
