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

        DispatchQueue.global(qos: .background).async { [weak self] in

            guard
                let urlStr = url,
                !urlStr.isEmpty,
                let imageURL = URL(string: urlStr)
                else {
                    self?.setNew(Image: nil)
                    return
            }
            guard let imageFromCache = imageCache.object(forKey: urlStr as NSString) else {
                URLSession.shared.dataTask(with: imageURL) { (data, respose, _) in
                    var newImage: UIImage = UIImage(named: ImageConstants.downloadFail)!
                    if let httpResponse = respose as? HTTPURLResponse,
                        httpResponse.statusCode == ResponseConstants.Status.code_200,
                            let localData = data,
                                let img = UIImage(data: localData) {
                        newImage = img
                    }
                    imageCache.setObject(newImage, forKey: urlStr as NSString)
                    self?.setNew(Image: newImage)
                }.resume()
                return
            }
            self?.setNew(Image: imageFromCache)
        }
    }

    private func setNew(Image newImage: UIImage?) {

        DispatchQueue.main.async { [weak self] in
            self?.image = newImage ?? UIImage(named: ImageConstants.downloadFail)
        }
    }

}
