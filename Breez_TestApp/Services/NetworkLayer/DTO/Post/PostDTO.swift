//
//  PostDTO.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 9/11/23.
//

import Foundation

struct PostDTO: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
