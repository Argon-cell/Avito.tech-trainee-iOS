//
//  AdvertisementDetail.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 25.08.2023.
//

import Foundation

struct AdvertisementDetail {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageUrl: String
    let createdDate: String
    let description: String
    let email: String
    let phoneNumber: String
    let address: String
    
    init(from dto: AdvertisementDetailDTO) {
        self.id = dto.id
        self.title = dto.title
        self.price = dto.price
        self.location = dto.location
        self.imageUrl = dto.imageUrl
        self.createdDate = dto.createdDate
        self.description = dto.description
        self.email = dto.email
        self.phoneNumber = dto.phoneNumber
        self.address = dto.address
    }
}

// MARK: - Dto model

struct AdvertisementDetailDTO: Decodable {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageUrl: String
    let createdDate: String
    let description: String
    let email: String
    let phoneNumber: String
    let address: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case location
        case imageUrl = "image_url"
        case createdDate = "created_date"
        case description
        case email
        case phoneNumber = "phone_number"
        case address
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.price = try container.decode(String.self, forKey: .price)
        self.location = try container.decode(String.self, forKey: .location)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        self.createdDate = try container.decode(String.self, forKey: .createdDate)
        self.description = try container.decode(String.self, forKey: .description)
        self.email = try container.decode(String.self, forKey: .email)
        self.phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        self.address = try container.decode(String.self, forKey: .address)
    }
}
