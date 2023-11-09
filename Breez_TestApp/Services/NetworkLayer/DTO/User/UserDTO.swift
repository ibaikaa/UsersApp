//
//  UserDTO.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 8/11/23.
//

import Foundation

struct UserDTO: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: AddressDTO
    let company: CompanyDTO
}
