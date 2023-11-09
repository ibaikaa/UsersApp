//
//  UsersViewModel.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 8/11/23.
//

import Foundation

final class UsersViewModel: BaseViewModel<[UserDTO]> {
    
    override func fetchData() {
        super.fetchData()
        
        NetworkManager.fetchUsers(completion: handleResult)
    }
    
    func numberOfRows() -> Int {
        data?.count ?? 0
    }
    
    func user(at indexPath: IndexPath) -> UserDTO? {
        data?[indexPath.row]
    }
    
}
