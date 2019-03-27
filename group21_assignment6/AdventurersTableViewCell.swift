//
//  AdventurersTableViewCell.swift
//  group21_assignment6
//
//  Created by Argandona Vite, Angel R on 3/14/19.
//  Copyright © 2019 Pacleb, Alyssa June N. All rights reserved.
//

import UIKit

class AdventurersTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tableImageView: UIImageView!
    @IBOutlet weak var tableLabel1: UILabel!
    @IBOutlet weak var tableLabel2: UILabel!
    @IBOutlet weak var tableLabel3: UILabel!
    
    func displayContent(image: UIImage, label1: String, label2: String, label3: String){
        tableImageView.image = image
        tableLabel1.text = label1
        tableLabel2.text = label2
        tableLabel3.text = label3
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
