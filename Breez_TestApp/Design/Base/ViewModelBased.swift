//
//  ViewModelBased.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 9/11/23.
//

import UIKit

protocol ViewModelBased {
    
    associatedtype ViewModel
    var viewModel: ViewModel { get set }
    
    func initViewModel()
}
