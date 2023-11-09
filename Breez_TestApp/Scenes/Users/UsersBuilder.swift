//
//  UsersBuilder.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 8/11/23.
//

import UIKit

enum UsersBuilder {
    
    static func create() -> UIViewController {
        let viewModel = UsersViewModel(navigationBarTitle: "Users")
        
        let vc = UsersViewController(viewModel: viewModel)
        
        return vc
    }
    
}
