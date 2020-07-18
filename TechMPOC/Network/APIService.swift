//
//  APIService.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 18/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import Foundation

class APIService {

    public static let shared = APIService()

    func requestJSONDataFrom(Service service: serviceReturnType?,
                            completion: @escaping (Data) -> Void) {

        guard
            let serviceType = service,
            Reachability.shared.isConnectedToNetwork()
            else {
                print("No internet")
                return
        }
        do {
            let urlRequest = try URLRequest(serviceType)
            URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, urlResponse, error) in

                guard let strongSelf = self else { return }
                let val = strongSelf.validate(ResponseData: data, withRequest: urlResponse, andError: error)
                if let errorVal = val as? String {
                    print(errorVal)
                } else if let jsonData = val as? Data {
                    completion(jsonData)
                }
            }.resume()
        } catch  {
            print(error.localizedDescription)
        }
    }

    private func validate(ResponseData data: Data?,
                            withRequest urlResponse: URLResponse?,
                                andError error: Error?) -> Any? {

        if let err = error {
            return parse(Error: err, withURLResponse: urlResponse)
        } else if let responseData = data {
            do {
                let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .allowFragments)
                // print(jsonData)
                return jsonData
            } catch {
                return parse(Error: error, withURLResponse: urlResponse)
            }
        }
        return nil
    }

    private func parse(Error error: Error,
                        withURLResponse urlResponse: URLResponse?) -> String? {

        var errorMsg: String? = error.localizedDescription
        if let statusError = self.isValidStatusCode(urlResponse) {
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
        case ResponseConstants.Status.code_403:
            return ResponseConstants.Message.SESSION_ERROR
        case ResponseConstants.Status.code_503, ResponseConstants.Status.code_502:
            return ResponseConstants.Message.SERVICE_UNAVAILABLE_ERROR
        default:
            break
        }
        return nil
    }
    
}
