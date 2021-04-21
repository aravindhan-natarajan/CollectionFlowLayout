//
//  AppDelegate.swift
//  PhotosList
//
//  Created by Aravindhan Natarajan on 21/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.rootViewController = HomeConfiguration.setup()
        return true
    }

     


}

