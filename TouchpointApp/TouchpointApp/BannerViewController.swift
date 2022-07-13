//
//  BannerViewController.swift
//  TouchPointApp
//
//  Created by Varun Batta on 2022-06-01.
//  Copyright © 2022 Vision Critical Communications Inc. All rights reserved.
//

import Foundation
import UIKit
import TouchPointKit

class BannerViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        TouchPointActivity.shared.setScreenName(screenName: "Banner Screen")
    }
    
}
