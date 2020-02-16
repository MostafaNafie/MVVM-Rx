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

class MainViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	var mainViewModel = MainViewModel()
	private let disposeBag = DisposeBag()
	
//	public var posts = PublishSubject<[Post]>()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		mainViewModel.fetchData()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		setupBinding()
	}
	
}

extension MainViewController {
	
	private func setupBinding() {
				
		// Bind the posts in the ViewModel to the DataSource of the TableView
		mainViewModel
			.posts
			.observeOn(MainScheduler.instance)
			.bind(to: tableView.rx.items(cellIdentifier: "cell")) { row, model, cell in
				cell.textLabel?.text = "\(model.user)"
//				print(model.user)
				}.disposed(by: disposeBag)
		
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

