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
	
	@IBOutlet weak var profileImage: UIImageView!
	@IBOutlet weak var userName: UILabel!
	@IBOutlet weak var postImage: UIImageView!
	
	var post: Post!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		userName.text = post.user
		profileImage.kf.setImage(with: post.getUserImageURL())
		postImage.kf.setImage(with: post.getImageURL())
		
		profileImage.layer.cornerRadius = profileImage.frame.height / 2
    }

}
