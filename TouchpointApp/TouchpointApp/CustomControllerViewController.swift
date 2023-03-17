//
//  CustomControllerViewController.swift
//  TouchPointApp
//
//  Created by Varun Batta on 2022-06-01.
//  Copyright © 2022 Vision Critical Communications Inc. All rights reserved.
//

import Foundation
import UIKit
import TouchPointKit

class CustomComponentViewController: UIViewController, TouchPointActivityDelegate {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    var curSelectedButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        TouchPointActivity.shared.refreshActivities()
    }
    
    func onTouchPointActivityComplete() {
        let activityCompleteAlert: UIAlertView = UIAlertView(title: "Thanks for completing the activity!", message: "We really appreciate your feedback",
                             delegate: self, cancelButtonTitle: "OK")
        activityCompleteAlert.show()
    }
    
    func onTouchPointActivityCollapse() {
        curSelectedButton?.isEnabled = false
    }
    
    @IBAction func onTapButton1(_ sender: Any) {
        curSelectedButton = button1
        TouchPointActivity.shared.openActivityForScreenComponent(screenName: "Custom Component Screen", componentName: "Button 1", delegate: self)
    }
    
    @IBAction func onTapButton2(_ sender: Any) {
        curSelectedButton = button2
        TouchPointActivity.shared.openActivityForScreenComponent(screenName: "Custom Component Screen", componentName: "Button 2", delegate: self)
    }
    
    @IBAction func onTapButton3(_ sender: Any) {
        curSelectedButton = button3
        TouchPointActivity.shared.openActivityForScreenComponent(screenName: "Custom Component Screen", componentName: "Button 3", delegate: self)
    }
}
