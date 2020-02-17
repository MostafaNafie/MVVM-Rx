//
//  Post.swift
//  IDE Porject
//
//  Created by Mustafa on 31/1/20.
//  Copyright © 2020 IDEAcademy. All rights reserved.
//

import Foundation

struct Post: Codable {
	let user: String
	let likes: Int
	let tags: String
	let userImageURL: String
	let largeImageURL: String
	
	func getImageURL() -> URL {
		return URL(string: largeImageURL)!
	}
	
	func getUserImageURL() -> URL {
		return URL(string: userImageURL)!
	}
	
	func getTags() -> String {
		var result = ""
		for tag in tags.split(separator: ",") {
			var newTag = "#" + tag.trimmingCharacters(in: .whitespaces)
			newTag = newTag.replacingOccurrences(of: " ", with: "_")
			result += newTag + " "
		}
		return result.trimmingCharacters(in: .whitespaces)
	}
	
}
