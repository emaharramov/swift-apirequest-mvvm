//
//  PostStruct.swift
//  networkApi
//
//  Created by Emil Maharramov on 10.10.24.
//

import Foundation

struct PostStruct: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
