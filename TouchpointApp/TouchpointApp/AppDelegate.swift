//
//  AppDelegate.swift
//  Touchpoint
//
//  Created by Dinesh Tanwar on 10/07/20.
//  Copyright © 2020 Vision Critical Communications Inc. All rights reserved.
//

import UIKit
import TouchPointKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let apiKey = "API_KEY"
        let apiSecret = "API_SECRET"
        let podName = TouchPointPods.na1
        let screenNames = ["Demo 1", "Demo 2"]
        let visitor = ["id": "12345", "email": "ios_visitor@example.com", "favorite_food": "oranges"]
        
        removeUserDefaults(podName: podName.value())
        
        TouchPointActivity.shared.shouldApplyAPIFilter = false
        //TouchPointActivity.shared.disableCaching = true
        //TouchPointActivity.shared.defaultBannerHeight = 50
        TouchPointActivity.shared.enableDebugLogs = true
        
        TouchPointActivity.shared.configure(apiKey: apiKey,
                                            apiSecret: apiSecret,
                                            podName: podName,
                                            screenNames: screenNames,
                                            visitor: visitor)
        
        return true
    }
    
    func removeUserDefaults(podName: String) {
        let userDefaults = UserDefaults.standard
        let dict = userDefaults.dictionaryRepresentation()
        
        for (key, _) in dict {
            if key .contains(podName) {
                userDefaults.removeObject(forKey: key)
            }
        }
        userDefaults.synchronize()
    }

}

