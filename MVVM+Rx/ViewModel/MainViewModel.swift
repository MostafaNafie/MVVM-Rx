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
    let posts = PublishSubject<[Post]>()
    let isLoading = PublishSubject<Bool>()
	private let disposeBag = DisposeBag()

	func fetchData() {
		isLoading.onNext(true)
		ApiClient
            .getPosts()
			.observeOn(MainScheduler.instance)
            .debug(#function)
			.subscribe(onNext: { [unowned self] response in
				self.posts.onNext(response.hits)
				self.isLoading.onNext(false)
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
