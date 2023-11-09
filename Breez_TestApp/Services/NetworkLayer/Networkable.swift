//
//  Networkable.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 9/11/23.
//

import Moya

protocol Networkable {
    
    static var provider: MoyaProvider<APIType> { get }
    
    static func fetchUsers(completion: @escaping (Result<[UserDTO], Error>) -> Void)
    
    static func fetchPosts(userId: Int, completion: @escaping (Result<[PostDTO], Error>) -> Void)
    
    static func fetchPostDetailed(postId: Int, completion: @escaping (Result<PostDTO, Error>) -> Void)
    
}
