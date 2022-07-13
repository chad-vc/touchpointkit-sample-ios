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

class CustomComponentViewController: UIViewController, TouchPointActivityCompletionDelegate {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    var curSelectedButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func onActivityComplete() {
        // Nothing to do
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
