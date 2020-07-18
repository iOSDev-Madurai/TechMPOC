//
//  Data+Extension.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 18/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import Foundation

extension Data {

    var jsonData: Data {
        if let _ = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers) {
            return self
        } else if
            let decodeData = String(decoding: self, as: UTF8.self).data(using: .utf8),
            let _ = try? JSONSerialization.jsonObject(with: decodeData, options: .mutableContainers) {
            return decodeData
        }
        return self
    }

}
