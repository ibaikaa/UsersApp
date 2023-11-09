//
//  NetworkManager.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 8/11/23.
//

import Moya

enum NetworkManager: Networkable {
    
    static var provider = MoyaProvider<APIType>(plugins: [NetworkLoggerPlugin()])
    
    static func fetchUsers(completion: @escaping (Result<[UserDTO], Error>) -> Void) {
        request(target: .users, completion: completion)
    }
    
    static func fetchPosts(userId: Int, completion: @escaping (Result<[PostDTO], Error>) -> Void) {
        request(target: .posts(userId: userId), completion: completion)
    }
    
    static func fetchPostDetailed(postId: Int, completion: @escaping (Result<PostDTO, Error>) -> Void) {
        request(target: .postDetailed(postId: postId), completion: completion)
    }
    
}

// MARK: - NetworkManager + request generic method

private extension NetworkManager {
    
    static func request<T: Decodable>(
        target: APIType,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let results = try self.decode(type: T.self, from: response.data)
                    
                    completion(.success(results))
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func decode<T: Decodable>(type: T.Type, from data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    
}
