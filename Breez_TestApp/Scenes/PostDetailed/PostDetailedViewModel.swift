//
//  PostDetailedViewModel.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 9/11/23.
//

import Foundation

final class PostDetailedViewModel: BaseViewModel<PostDTO> {
    
    private let postId: Int
    
    init(postId: Int, username: String) {
        self.postId = postId
        
        super.init(navigationBarTitle: "\(username). #\(postId)")
    }
    
    override func fetchData() {
        super.fetchData()
        
        NetworkManager.fetchPostDetailed(postId: postId, completion: handleResult)
    }
    
    func post() -> PostDTO? {
        data
    }
    
}
