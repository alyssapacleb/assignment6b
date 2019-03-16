//
//  avatarCell.swift
//  group21_assignment6
//
//  Created by Alyssa June Pacleb on 3/15/19.
//  Copyright © 2019 Pacleb, Alyssa June N. All rights reserved.
//

import UIKit

class avatarCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    func displayContent(image: UIImage){
        imageView.image = image
    }
}
