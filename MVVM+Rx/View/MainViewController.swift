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
	@IBOutlet private weak var tableView: UITableView!
	
	private let mainViewModel = MainViewModel() // In a real project the ViewModel should be injected
	private let activityIndicator = UIActivityIndicatorView()
	private let disposeBag = DisposeBag()
	
	// MARK: - View Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
        setupActivityIndicator()
        setupTableView()
		setupBinding()
		mainViewModel.fetchData()
	}
}

// MARK: - Helper Functions
extension MainViewController {
    private func setupTableView() {
        // Register the custom cell
        let nib = UINib(nibName: "PostCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PostCell")
    }
    
	private func setupBinding() {
		mainViewModel
            .isLoading
			.subscribe(onNext: { [unowned self] isLoading in
				self.updateUI(isLoading: isLoading)
			})
            .disposed(by: disposeBag)
				
		// Bind the posts in the ViewModel to the DataSource of the TableView
		mainViewModel
			.posts
            .debug("posts")
			.bind(to: tableView.rx.items(cellIdentifier: "PostCell", cellType: PostCell.self)) { row, model, cell in
				cell.post = model
            }
            .disposed(by: disposeBag)
		
		// Deselect an item when it is selected
		tableView.rx
            .itemSelected
			.subscribe(onNext: { [unowned self] indexPath in
				self.tableView.deselectRow(at: indexPath, animated: true)}
            )
            .disposed(by: disposeBag)
		
		// Get the model of the selected cell and inject it to the profile screen
		tableView.rx
            .modelSelected(Post.self)
            .debug("modelSelected")
			.subscribe(onNext: { [unowned self] post in
				self.goToProfileScreen(for: post)
			})
            .disposed(by: disposeBag)
	}
	
	private func setupActivityIndicator() {
		activityIndicator.color = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
		activityIndicator.center = self.view.center
		self.view.addSubview(activityIndicator)
	}
	
	private func goToProfileScreen(for post: Post) {
		let profileVC = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
		profileVC.post = post
		present(profileVC, animated: true, completion: nil)
	}
	
	private func updateUI(isLoading: Bool) {
        if isLoading {
            self.activityIndicator.startAnimating()
            self.tableView.isHidden = true
        } else {
            self.activityIndicator.stopAnimating()
            self.tableView.isHidden = false
        }
	}
}

