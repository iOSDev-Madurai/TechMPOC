//
//  Row.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 18/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import Foundation

struct Row: Codable {
    let title, rowDescription: String?
    let imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}
