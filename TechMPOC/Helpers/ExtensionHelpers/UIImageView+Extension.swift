//
//  UIImageView+Extension.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 19/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {

    func downloadedImageForm(URL url: String?) {

        guard let urlStr = url else {
            self.image = UIImage(named: ImageConstants.downloadFail)
            return
        }
        if let imageFromCache = imageCache.object(forKey: urlStr as NSString) {
            self.image = imageFromCache
            return
        }
        guard let imageURL = URL(string: urlStr) else {
            self.image = UIImage(named: ImageConstants.downloadFail)
            return
        }
        DispatchQueue.global(qos: .background).async {
            var newImage: UIImage!
            if let imageData = try? Data(contentsOf: imageURL),
                let image = UIImage(data: imageData) {
                newImage = image
            } else {
                newImage = UIImage(named: ImageConstants.downloadFail)
            }
            imageCache.setObject(newImage, forKey: urlStr as NSString)
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
    }

}
