//
//  MainViewController.swift
//  MVVM+Rx
//
//  Created by Mustafa on 16/2/20.
//  Copyright © 2020 Mustafa Nafie. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class MainViewController: UIViewController {

	// MARK: - Outlets and Properties

	@IBOutlet weak var tableView: UITableView!
	
	var mainViewModel = MainViewModel()
	private let disposeBag = DisposeBag()
	
	// MARK: - View Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		
		mainViewModel.fetchData()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		setupBinding()
	}
	
}

// MARK: - Helper Functions

extension MainViewController {
	
	private func setupBinding() {
		
		// Register the custom cell
		let nib = UINib(nibName: "PostCell", bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: "PostCell")
				
		// Bind the posts in the ViewModel to the DataSource of the TableView
		mainViewModel
			.posts
			.observeOn(MainScheduler.instance)
			.bind(to: tableView.rx.items(cellIdentifier: "PostCell", cellType: PostCell.self)) { row, model, cell in
//				print(model.user)
				cell.post = model
				}.disposed(by: disposeBag)
		
		// Deselect an item when it is selected
		tableView.rx.itemSelected
			.subscribe(onNext: { [unowned self] indexPath in
				self.tableView.deselectRow(at: indexPath, animated: true)}).disposed(by: disposeBag)
		
		// Get the model of the selected cell and inject it to the profile screen
		tableView.rx.modelSelected(Post.self)
			.subscribe(onNext: { [unowned self] post in
//				print(post)
				self.goToProfileScreen(for: post)
			}).disposed(by: disposeBag)
		
	}
	
	private func goToProfileScreen(for post: Post) {
		let profileVC = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
		profileVC.post = post
		present(profileVC, animated: true, completion: nil)
	}
	
}

