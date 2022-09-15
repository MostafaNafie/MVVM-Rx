//
//  APIError.swift
//  IDE Project
//
//  Created by Mustafa on 31/1/20.
//  Copyright © 2020 Mustafa Nafie. All rights reserved.
//

import Foundation

enum APIError: Error {
	case forbidden              //Status code 403
	case notFound               //Status code 404
	case conflict               //Status code 409
	case internalServerError    //Status code 500
}
