//
//  APIService.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 18/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import UIKit

class APIService {

    public static let shared = APIService()

    func requestJSONDataFrom(Service service: serviceReturnType?,
                                completion: @escaping (Data) -> Void) {

        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        DispatchQueue.global(qos: .background).async { [weak self] in

            guard let serviceType = service else {
                self?.removeIndicator(ResponseConstants.Message.NETWORK_FAILURE_ERROR)
                return
            }
            guard Reachability.shared.isConnectedToNetwork() else {
                self?.removeIndicator(ResponseConstants.Message.NO_NETWORK)
                return
            }
            do {
                let urlRequest = try URLRequest(serviceType)
                URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, urlResponse, error) in
                    DispatchQueue.main.async {
                        let val = self?.validate(ResponseData: data, withRequest: urlResponse, andError: error)
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        if let errorVal = val as? String {
                            self?.removeIndicator(errorVal)
                        } else if let jsonData = val as? Data {
                            completion(jsonData)
                        }
                    }
                }.resume()
            } catch  {
                self?.removeIndicator(error.localizedDescription)
            }
        }
    }

    private func removeIndicator(_ msg: String?) {

        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if let errorMsg = msg, let top = UIApplication.topViewController() {
                top.showAlertWith(andMessage: errorMsg)
            }
        }
    }

    private func validate(ResponseData data: Data?,
                            withRequest urlResponse: URLResponse?,
                                andError error: Error?) -> Any? {

        if let err = error {
            return parse(Error: err, withURLResponse: urlResponse)
        } else if let responseData = data {
            return responseData.jsonData
        }
        return nil
    }

    private func parse(Error error: Error,
                        withURLResponse urlResponse: URLResponse?) -> String? {

        var errorMsg: String? = error.localizedDescription
        if let statusError = isValidStatusCode(urlResponse) {
            errorMsg = statusError
        }
        return errorMsg
    }

    //Status valid and error message

    private func isValidStatusCode(_ respose: URLResponse?) -> String? {

        guard let httpResponse = respose as? HTTPURLResponse else {
            return ResponseConstants.Message.SERVER_ERROR
        }
        let statusCode = httpResponse.statusCode
        switch statusCode {
        case ResponseConstants.Status.code_500:
            return ResponseConstants.Message.SERVER_ERROR
        case ResponseConstants.Status.code_404:
            return ResponseConstants.Message.REQUEST_ERROR
        case ResponseConstants.Status.code_503, ResponseConstants.Status.code_502:
            return ResponseConstants.Message.SERVICE_UNAVAILABLE_ERROR
        default:
            break
        }
        return nil
    }
    
}
