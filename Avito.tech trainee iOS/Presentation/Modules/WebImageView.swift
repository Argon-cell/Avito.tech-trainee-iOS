//
//  WebImageView.swift
//  Avito.tech trainee iOS
//
//  Created by Ильгам Нафиков on 26.08.2023.
//

import Foundation
import UIKit

var imageCache = NSCache<NSURL, UIImage>()

class WebImageView: UIImageView {
    private var task: URLSessionDataTask!

    func loadImage(url: URL) {
        image = nil

        if let task = task {
            task.cancel()
        }

        if let cachedImage = imageCache.object(forKey: url as NSURL) {
            self.image = cachedImage
        } else {
            self.task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                guard let self = self,
                      let data = data,
                      let loadedImage = UIImage(data: data) else {
                    return
                }
                
                let resizedLoadedImage = loadedImage.aspectFittedToHeight(120)

                DispatchQueue.main.async {
                    self.image = resizedLoadedImage
                }

                imageCache.setObject(resizedLoadedImage, forKey: url as NSURL)
            }
            self.task.resume()
        }
    }
}
