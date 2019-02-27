//
//  CustomCollectionViewCell.swift
//  ExperimentalProject
//
//  Created by Zeshan Ahmad on 27/02/2019.
//  Copyright © 2019 Zeshan Ahmad. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var circleImageView: UIImageView!
    override var isSelected: Bool{
        didSet{
            if self.isSelected
            {
                self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                circleImageView.isHidden = false
                monthLabel.isHidden = false
                dayNameLabel.isHidden = false
                dayLabel.textColor = UIColor(red: 5.0/255.0, green: 150.0/255.0, blue: 215.0/255.0, alpha: 1.0)
            
            }
            else
            {
                self.transform = CGAffineTransform.identity
                circleImageView.isHidden = true
                monthLabel.isHidden = true
                dayNameLabel.isHidden = true
                dayLabel.textColor = UIColor.darkGray
            }
        }
    }
}
