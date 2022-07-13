//
//  PopupViewController.swift
//  TouchPointApp
//
//  Created by Varun Batta on 2022-06-01.
//  Copyright © 2022 Vision Critical Communications Inc. All rights reserved.
//

import Foundation
import UIKit
import TouchPointKit

class PopupViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        TouchPointActivity.shared.setScreenName(screenName: "Popup Screen")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        TouchPointActivity.shared.cancelPopupForScreen(screenName: "Popup Screen")
    }
    
    @IBAction func cancelPopup(_ sender: Any) {
        TouchPointActivity.shared.cancelPopupForScreen(screenName: "Popup Screen")
    }
    
}
