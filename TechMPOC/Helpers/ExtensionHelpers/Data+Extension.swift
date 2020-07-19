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
        } else if let isoStr = String(data: self, encoding: .isoLatin1) {
            return isoStr.data(using: .utf8) ?? self
        }
        return self
    }

}
