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

	@IBOutlet weak var testlabel: UILabel!
	
	var post: Post!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		testlabel.text = post.user
    }

}
