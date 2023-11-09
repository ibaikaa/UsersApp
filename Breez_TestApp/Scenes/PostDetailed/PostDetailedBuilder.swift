//
//  PostDetailedBuilder.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 9/11/23.
//

import UIKit

enum PostDetailedBuilder {
    
    static func create(postId: Int, username: String) -> UIViewController {
        let viewModel = PostDetailedViewModel(postId: postId, username: username)
        
        let vc = PostDetailedViewController(viewModel: viewModel)
        
        return vc
    }
    
}
