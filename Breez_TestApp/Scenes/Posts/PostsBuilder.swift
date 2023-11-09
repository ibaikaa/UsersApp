//
//  PostsBuilder.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 8/11/23.
//

import UIKit

enum PostsBuilder {
    
    static func create(
        id userId: Int,
        name: String,
        username: String
    ) -> UIViewController {
        let viewModel = PostsViewModel(
            userId: userId,
            name: name,
            username: username
        )
        
        let vc = PostsViewController(viewModel: viewModel)
        
        return vc
    }
    
}
