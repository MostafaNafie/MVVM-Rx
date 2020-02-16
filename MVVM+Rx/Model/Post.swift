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
	let largeImageURL: String
}
