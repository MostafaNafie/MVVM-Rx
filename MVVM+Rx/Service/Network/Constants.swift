//
//  Constants.swift
//  IDE Porject
//
//  Created by Mustafa on 31/1/20.
//  Copyright © 2020 IDEAcademy. All rights reserved.
//

import Foundation

struct Constants {
	
	// The API's base URL
	static let baseUrl = "https://pixabay.com/api"
	
	// The parameters (Queries)
	struct Parameters {
		static let key = "key"
		static let q = "q"
		static let imageType = "image_type"
		
		static let keyValue = "11778875-bd18dbcb72c8cc6ad02f06b46"
		static let qValue = "animal+love"
		static let imageTypeValue = "photo"
	}
	
	// The header fields
	enum HttpHeaderField: String {
		case authentication = "Authorization"
		case contentType = "Content-Type"
		case acceptType = "Accept"
		case acceptEncoding = "Accept-Encoding"
	}
	
	// The content type (JSON)
	enum ContentType: String {
		case json = "application/json"
	}
	
}
