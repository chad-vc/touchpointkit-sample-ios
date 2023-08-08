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
        let podName = TouchPointPods.eu2
        let locale = "FR"
        let screenComponents = [
            [ "screenName": "Banner Screen" ],
            [ "screenName": "Popup Screen"],
            [ "screenName": "Custom Component Screen",
              "componentName": "Button 1"
            ],
            [ "screenName": "Custom Component Screen",
              "componentName": "Button 2"
            ],
            [ "screenName": "Custom Component Screen",
              "componentName": "Button 3"
            ],
        ]
        let visitor = [
            "id": "12346",
            "userAttributes": [
                [
                    "key": "age",
                    "type": "number",
                    "value": "53"
                ],
                [
                    "key": "isLoyaltyMember",
                    "type": "boolean",
                    "value": "true"
                ],
                [
                    "key": "city",
                    "type": "string",
                    "value": "Springfield"
                ],
                [
                    "key": "previousVisitDate",
                    "type": "date",
                    "value": "2022-04-11T21:51:34+0000"
                ]
            ]
        ] as [String : Any]
        
        removeUserDefaults(podName: podName.value())
        
//        TouchPointActivity.shared.disableAPIFilter = false
//        TouchPointActivity.shared.disableCaching = true
//        TouchPointActivity.shared.defaultBannerHeight = 50
//        TouchPointActivity.shared.enableDebugLogs = false
        
        TouchPointActivity.shared.configure(apiKey: apiKey,
                                            apiSecret: apiSecret,
                                            podName: podName,
                                            // Uncomment this to see it in French
                                            // locale: locale,
                                            screenComponents: screenComponents,
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

