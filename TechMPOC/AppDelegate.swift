//
//  AppDelegate.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 18/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        addRootViewController()
        return true
    }

    /*
     First view controller of our app.
    */
    private func addRootViewController() {

        let about = AboutTableViewController()
        window!.rootViewController = about
        window!.makeKeyAndVisible()
    }

}

