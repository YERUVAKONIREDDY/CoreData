//
//  studentListCell.swift
//  CoreDataPractice
//
//  Created by IMACDEV on 15/04/19.
//  Copyright © 2019 IMACDEV. All rights reserved.
//

import UIKit

class studentListCell: UITableViewCell {
   
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    
    var student:Student!
    {didSet{
        if let model = student
        {
            nameLabel.text = model.name
            addressLabel.text = model.address
            cityLabel.text = model.city
            mobileNumberLabel.text = model.mobile
        }
    }}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
