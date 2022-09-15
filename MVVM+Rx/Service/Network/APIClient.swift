//
//  APIClient.swift
//  IDE Project
//
//  Created by Mustafa on 31/1/20.
//  Copyright © 2020 Mustafa Nafie. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class ApiClient {
	static func getPosts() -> Observable<Response> {
		return request(APIRouter.getPosts)
	}
	
	// MARK: - The request function to get results in an Observable
	private static func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
		// Create an RxSwift observable
		return Observable<T>.create { observer in
			// Trigger the HttpRequest using AlamoFire
			let request = AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
				switch response.result {
				case .success(let value):
					observer.onNext(value)
					observer.onCompleted()
				case .failure(let error):
					switch response.response?.statusCode {
					case 403:
						observer.onError(APIError.forbidden)
					case 404:
						observer.onError(APIError.notFound)
					case 409:
						observer.onError(APIError.conflict)
					case 500:
						observer.onError(APIError.internalServerError)
					default:
						observer.onError(error)
					}
				}
			}
			
			// Return a disposable to stop the request
			return Disposables.create {
				request.cancel()
			}
		}
	}
	
}
