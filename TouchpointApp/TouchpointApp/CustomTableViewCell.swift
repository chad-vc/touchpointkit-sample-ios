//
//  CustomTableViewCell.swift
//  TouchPointApp
//
//  Created by Dinesh Tanwar on 19/08/20.
//  Copyright © 2020 Vision Critical Communications Inc. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewCard.clipsToBounds = true
        viewCard.layer.cornerRadius = 8
        //viewCard.layer.borderWidth = 1
        //viewCard.layer.borderColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0).cgColor
        viewCard.backgroundColor = UIColor.white
        
        viewCard.layer.shadowColor = UIColor.gray.cgColor
        viewCard.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        viewCard.layer.shadowRadius = 12.0
        viewCard.layer.shadowOpacity = 0.7
        
        let shadowPath = UIBezierPath(roundedRect: viewCard.bounds, cornerRadius: 8)
        viewCard.layer.shadowPath = shadowPath.cgPath
        
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
