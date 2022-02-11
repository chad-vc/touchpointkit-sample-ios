//
//  MainViewController.swift
//  TouchPointApp
//
//  Created by Dinesh Tanwar on 27/07/20.
//  Copyright © 2020 Vision Critical Communications Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnDemo1(_ sender: Any) {
        guard let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Demo1ViewController") as? Demo1ViewController else {
            return
        }
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func btnDemo3(_ sender: Any) {
        guard let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Demo5NavViewController") as? UINavigationController else {
            return
        }
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
}
