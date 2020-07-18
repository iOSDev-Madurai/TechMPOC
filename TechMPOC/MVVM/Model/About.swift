//
//  About.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 18/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import Foundation

struct About: Codable {

    let title: String
    let rows: [Row]

    private(set) lazy var aboutRows: [Row] = {
        return rows.compactMap { (row) -> Row? in
            return row.title == nil && row.rowDescription == nil && row.imageHref == nil ? nil : row
        }
    }()
}
