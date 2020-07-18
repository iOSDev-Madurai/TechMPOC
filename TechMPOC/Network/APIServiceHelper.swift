//
//  APIServiceHelper.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 18/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import Foundation

class APIServiceHelper {

    public static let shared = APIServiceHelper()

    func factsAPIDetails() -> serviceReturnType {
        return (URLConstants.facts, nil, .get, nil)
    }

}
