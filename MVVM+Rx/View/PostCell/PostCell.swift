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
	
	var post: Post! {
		didSet {
			displayData()
			setupUI()
		}
	}
    
}

// MARK: - Helper Functions

extension PostCell {
	
	private func displayData() {
		userName.text = post.user
		likes.text = String(post.likes)
		profileImage.kf.setImage(with: post.getUserImageURL(), placeholder: UIImage(named: "profile"))
		postImage.kf.setImage(with: post.getImageURL(), placeholder: UIImage(named: "placeholder"))
	}
	
	private func setupUI() {
		profileImage.layer.cornerRadius = profileImage.frame.height / 2
		postImage.layer.cornerRadius = 14
	}
	
}
