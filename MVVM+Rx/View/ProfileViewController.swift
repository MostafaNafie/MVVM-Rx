//
//  ProfileViewController.swift
//  MVVM+Rx
//
//  Created by Mustafa on 16/2/20.
//  Copyright © 2020 Mustafa Nafie. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProfileViewController: UIViewController {
	
	// MARK: - Outlets and Properties

	@IBOutlet weak var userName: UILabel!
	@IBOutlet weak var profileImage: UIImageView!
	@IBOutlet weak var postImage: UIImageView!
	
	var post: Post!
	
	// MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
		
		displayData()
		setupUI()
    }

}

// MARK: - Helper Functions

extension ProfileViewController {
	
	private func displayData() {
		userName.text = post.user
		profileImage.kf.setImage(with: post.getUserImageURL(), placeholder: UIImage(named: "profile"))
		postImage.kf.setImage(with: post.getImageURL(), placeholder: UIImage(named: "placeholder"))
	}
	
	private func setupUI() {
		profileImage.layer.cornerRadius = profileImage.frame.height / 2
	}
	
}
