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
	
	func fetchData() {
		ApiClient.getPosts()
			.observeOn(MainScheduler.instance)
			.subscribe(onNext: { response in
				print("Endpoint Called Successfully")
				print(response)
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
