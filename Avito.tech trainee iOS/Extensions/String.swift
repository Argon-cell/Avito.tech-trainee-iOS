//
//  String.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 27.08.2023.
//

import Foundation

extension String {
    func localizedDateString(with format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        
        switch date {
            case .none:
                return self
            case .some(let unwrappedDate):
                if unwrappedDate == Date.yesterday {
                    return "Вчера"
                } else if unwrappedDate == Date.now {
                    return "Сегодня"
                } else {
                    return DateFormatter.localizedString(from: unwrappedDate, dateStyle: .long, timeStyle: .none)
                }
        }
    }
}
