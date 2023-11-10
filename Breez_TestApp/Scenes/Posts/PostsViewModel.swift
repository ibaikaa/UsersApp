//
//  PostsViewModel.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 9/11/23.
//

import Foundation

final class PostsViewModel: BaseViewModel<[PostDTO]> {
    
    private let userId: Int
    private let _username: String
    
    init(userId: Int, name: String, username: String) {
        self.userId = userId
        self._username = username
        
        super.init(navigationBarTitle: name)
    }
    
    override func fetchData() {
        super.fetchData()
        
        NetworkManager.fetchPosts(userId: userId, completion: handleResult)
    }
    
    func numberOfItems() -> Int {
        data?.count ?? 0
    }
    
    func username() -> String {
        _username
    }
    
    func post(at indexPath: IndexPath) -> PostDTO? {
        data?[indexPath.row]
    }
    
}
