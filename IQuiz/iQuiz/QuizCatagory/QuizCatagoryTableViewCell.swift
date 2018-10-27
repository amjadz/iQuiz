//
//  QuizCatagoryTableViewCell.swift
//  iQuiz
//
//  Created by Zubair Amjad on 10/27/18.
//  Copyright © 2018 Zubair Amjad. All rights reserved.
//

import UIKit

class QuizCatagoryTableViewCell: UITableViewCell {

    @IBOutlet weak var catagoryPic: UIImageView!
    
    @IBOutlet weak var catagoryLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
