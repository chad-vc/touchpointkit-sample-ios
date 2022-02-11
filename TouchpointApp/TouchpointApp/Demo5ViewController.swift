//
//  Demo5ViewController.swift
//  TouchPointApp
//
//  Created by Dinesh Tanwar on 19/08/20.
//  Copyright © 2020 Vision Critical Communications Inc. All rights reserved.
//

import UIKit
import TouchPointKit

class Demo5ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TouchPointActivityCompletionDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let screenName = "Demo 1"
    
    var animals: [String] = [
        "The lion is a species in the family Felidae and a member of the genus Panthera. It is most recognisable for its muscular, deep-chested body, short, rounded head, round ears, and a hairy tuft at the end of its tail.",
        "Hamsters are rodents (order Rodentia) belonging to the subfamily Cricetinae, which contains 19 species classified in seven genera. They have become established as popular small house pets.",
        "Turtles are reptiles of the order Testudines characterized by a special bony or cartilaginous shell developed from their ribs and acting as a shield.",
        "The horse (Equus ferus caballus) is one of two extant subspecies of Equus ferus. It is an odd-toed ungulate mammal belonging to the taxonomic family Equidae. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, Eohippus, into the large, single-toed animal of today.",
        "Vision Critical provides a cloud-based customer intelligence platform that allows companies to build engaged, secure communities of customers. Based in Vancouver, the company was founded by Andrew Reid in 2000 and works with over 700 global brands around the world.",
        "The greater coucal or crow pheasant (Centropus sinensis), is a large non-parasitic member of the cuckoo order of birds, the Cuculiformes. A widespread resident in the Indian Subcontinent and Southeast Asia, it is divided into several subspecies, some being treated as full species.",
        "The raccoon is a medium-sized mammal native to North America. The raccoon is the largest of the procyonid family, having a body length of 40 to 70 cm (16 to 28 in) and a body weight of 5 to 26 kg (11 to 57 lb). Its grayish coat mostly consists of dense underfur which insulates it against cold weather.",
        "The tiger (Panthera tigris) is the largest extant cat species and a member of the genus Panthera. It is most recognisable for its dark vertical stripes on orange-brown fur with a lighter underside. It is an apex predator, primarily preying on ungulates such as deer and wild boar."
    ]
    
    var images: [String] = [
        "img1.jpeg",
        "img2.jpeg",
        "img3.jpeg",
        "img4.jpeg",
        "img5.jpeg",
        "img6.jpeg",
        "img7.jpeg",
        "img8.jpeg"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TouchPointActivity.shared.setScreenName(screenName: screenName, banner: false)
        
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissScreen))
        cancel.tintColor = UIColor.white
        navigationItem.leftBarButtonItems = [cancel]

        
        tableView.backgroundColor = UIColor.darkGray //UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        
        let height = (self.view.bounds.width) * (352/414)
        tableView.estimatedRowHeight = height
        tableView.rowHeight = height
        
        if !TouchPointActivity.shared.shouldShowActivity(screenName: screenName) {
            animals.remove(at: 4)
            images.remove(at: 4)
        }
        tableView.reloadData()
    }
    
    @objc func dismissScreen() {
        self.dismiss(animated: true, completion: nil)
    }
    

    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        
        cell.selectionStyle = .none
        
        // set the text from the data model
        cell.lblTitle?.text = self.animals[indexPath.row]
        
        let imgName = self.images[indexPath.row]
        cell.imgView?.image = UIImage(named: imgName)
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        if indexPath.row == 4 {            
            TouchPointActivity.shared.openActivityForScreen(screenName: screenName, delegate: self)
        }
    }
    
    public func didActivityCompleted() {
        print("didActivityCompleted...")
        animals.remove(at: 4)
        images.remove(at: 4)
        tableView.reloadData()
    }
}
