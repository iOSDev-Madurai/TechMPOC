//
//  ResponseConstants.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 18/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import Foundation

struct ResponseConstants {

    static let statusCode = "statusCode"

    struct Status {

        static let code_401 = 401
        static let code_500 = 500
        static let code_404 = 404
        static let code_403 = 403
        static let code_503 = 503
        static let code_502 = 502
        static let code_109 = 109
        static let code_105 = 105
        static let code_200 = 200
        static let code_201 = 201
    }

    struct Message {

        static let SERVER_ERROR = "Internal Server Error."
        static let REQUEST_ERROR = "Requested page not found."
        static let SESSION_ERROR = "Session Expired."
        static let SERVICE_UNAVAILABLE_ERROR = "Service unavailable, please try again."
        static let NETWORK_CONNECTION_ERROR = "Please check your network connection."
        static let NETWORK_FAILURE_ERROR = "Network error. Please try again."
        static let CONNECTION_TIMED_OUT = "Connection timeout, Do you want to retry?"
        static let NO_NETWORK = "No network. Please check your data connection and try again."
        static let CONNECTION_TIMED_OUT_ERROR = "Connection timed out."
        static let ACCOUNT_LOCKED_ERROR = "Your account has been locked, please try after some time."
    }

}
