//
//  MainViewModel.swift
//  MVVM+Rx
//
//  Created by Mustafa on 16/2/20.
//  Copyright © 2020 Mustafa Nafie. All rights reserved.
//

import Foundation
import RxSwift

class MainViewModel {
	
	private let disposeBag = DisposeBag()
	public let posts : PublishSubject<[Post]> = PublishSubject()

	
	func fetchData() {
		ApiClient.getPosts()
			.observeOn(MainScheduler.instance)
			.subscribe(onNext: { [unowned self] response in
				print("Endpoint Called Successfully")
//				print(response)
				self.posts.onNext(response.hits)
				}, onError: { error in
					switch error {
					case APIError.conflict:
						print("Conflict error")
					case APIError.forbidden:
						print("Forbidden error")
					case APIError.notFound:
						print("Not found error")
					default:
						print("Unknown error:", error)
					}
			})
			.disposed(by: disposeBag)
	}
	
}
