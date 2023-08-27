//
//  HTTPNetworkResponse.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 24.08.2023.
//

import Foundation

struct HTTPNetworkResponse {
    static func handleNetworkResponse(for response: HTTPURLResponse?) -> Result<Void, HTTPError> {
        guard let response = response else {
            return .failure(HTTPError.failedResponseUnwrapping)
        }
        switch response.statusCode {
        case 200: return .success(())
        case 400: return .failure(HTTPError.wrongRequest)
        case 401: return .failure(HTTPError.authenticationError)
        case 404: return .failure(HTTPError.notFound)
        case 500...599: return .failure(HTTPError.serverSideError)
        default: return .failure(HTTPError.failed)
        }
    }
}
