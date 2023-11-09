//
//  APIType.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 9/11/23.
//

import Moya

enum APIType: TargetType {
    case users
    case posts(userId: Int)
    case postDetailed(postId: Int)
    
    var baseURL: URL {
        URL(string: APIConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .users:
            return APIConstants.users
            
        case .posts:
            return APIConstants.posts
            
        case .postDetailed(let postId):
            return APIConstants.posts + String(postId)
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self {
        case .users, .postDetailed:
            return .requestPlain
            
        case .posts(let userId):
            return .requestParameters(
                parameters: [APIConstants.posts: userId],
                encoding: URLEncoding.default
            )
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
}
