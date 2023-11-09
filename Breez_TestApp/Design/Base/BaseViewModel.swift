//
//  BaseViewModel.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 9/11/23.
//

import UIKit
import Moya

protocol BaseViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var showError: ((String) -> Void)? { get set }
    
    associatedtype Data: Decodable
    var data: Data? { get set }
    
    var navigationBarTitle: String { get set }
    
    func fetchData()
}

class BaseViewModel<Data: Decodable>: BaseViewModelProtocol {
    
    var reloadData: (() -> Void)?
    var showError: ((String) -> Void)?
    
    var data: Data?
    
    var navigationBarTitle: String
    init(navigationBarTitle: String) {
        self.navigationBarTitle = navigationBarTitle
    }
    
    func fetchData() {
        // This method is used to override in child classes
    }
    
    final func handleResult(_ result: Result<Data, Error>) {
        switch result {
        case .success(let model):
            data = model
            
            reloadData?()
            
        case .failure(let failure):
            let error = failure.asAFError?.errorDescription ?? APIConstants.undefinedError
            
            showError?(error)
        }
    }
    
}
