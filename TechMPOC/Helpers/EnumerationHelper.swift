//
//  EnumerationHelper.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 18/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import Foundation

/*
 Type of APIError's
*/
enum APIError: Error {
    case invalidURL(url: String)
    case missingURL
}
