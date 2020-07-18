//
//  AboutViewModel.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 18/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import UIKit

class AboutViewModel: NSObject {

    func getDetailsOfFacts(_ completion: @escaping (About) -> Void) {

        let service = APIServiceHelper.shared.factsAPIDetails()
        // JSON Data
        APIService.shared.requestJSONDataFrom(Service: service) { (jsonData) in
            do {
                let planDetails = try JSONDecoder().decode(About.self, from: jsonData)
                completion(planDetails)
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
    }

}
