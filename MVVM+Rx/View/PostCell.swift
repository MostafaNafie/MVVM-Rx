//
//  PostCell.swift
//  MVVM+Rx
//
//  Created by Mustafa on 16/2/20.
//  Copyright © 2020 Mustafa Nafie. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

	@IBOutlet weak var profileImage: UIImageView!
	@IBOutlet weak var userName: UILabel!
	@IBOutlet weak var likes: UILabel!
	@IBOutlet weak var postImage: UIImageView!
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		profileImage.layer.cornerRadius = profileImage.frame.height / 2
		postImage.layer.cornerRadius = 14
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
