//
//  Demo1ViewController.swift
//  TouchPointApp
//
//  Created by Dinesh Tanwar on 27/07/20.
//  Copyright © 2020 Vision Critical Communications Inc. All rights reserved.
//

import UIKit
import TouchPointKit

class Demo1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TouchPointActivity.shared.setScreenName(screenName: "Demo 2")
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
