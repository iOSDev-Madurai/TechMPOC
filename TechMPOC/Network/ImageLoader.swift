//
//  ImageLoader.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 19/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import UIKit

class ImageLoader {

    var cache: NSCache<NSString, UIImage>!

    init() {
        cache = NSCache()
    }

    func obtainImageWith(ImagePath imagePath: String?,
                            completionHandler: @escaping (UIImage) -> ()) {

        DispatchQueue.global(qos: .background).async { [weak self] in
            guard
                Reachability.shared.isConnectedToNetwork(),
                let imagePath = imagePath, !imagePath.isEmpty
                else {
                    completionHandler(#imageLiteral(resourceName: "errorDown"))
                    return
            }
            if let image = self?.cache.object(forKey: imagePath as NSString) {
                completionHandler(image)
            } else if let url = URL(string: imagePath) {
                completionHandler(#imageLiteral(resourceName: "down-arrow (6)"))
                URLSession.shared.dataTask(with: url, completionHandler: { (data, respose, _) in
                    guard
                        let httpResponse = respose as? HTTPURLResponse,
                        httpResponse.statusCode == ResponseConstants.Status.code_200,
                        let localData = data,
                        let img = UIImage(data: localData)
                        else {
                            completionHandler(#imageLiteral(resourceName: "errorDown"))
                            return
                    }
                    self?.cache.setObject(img, forKey: imagePath as NSString)
                    completionHandler(img)
                }).resume()
            } else {
                completionHandler(#imageLiteral(resourceName: "errorDown"))
            }
        }
    }

}
