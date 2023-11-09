//
//  Images.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 8/11/23.
//

import UIKit

enum AppImage: String {
    case person = "person.fill"
    case email = "mail"
    case city = "building.2.crop.circle"
    case zipcode = "mail.stack"
    case location = "mappin"
    case company = "building"
}

enum AppImages {
    
    static func getSystemImage(
        from image: AppImage
    ) -> UIImage? {
        UIImage(systemName: image.rawValue)
    }
    
}
