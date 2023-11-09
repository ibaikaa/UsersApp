//
//  BaseViewController.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 9/11/23.
//

import UIKit

class BaseViewController<ViewModel: BaseViewModelProtocol>: UIViewController, ViewModelBased {
    
    // MARK: Properties
    
    var viewModel: ViewModel
    
    
    // MARK: Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UIViewController Lifecycle
    
    override func loadView() {
        super.loadView()
        
        initViewModel()
        setNavigationBarTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.fetchData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupUI()
        setupSubviews()
        layoutSubviews()
    }
    
    // MARK: Methods
    
    func initViewModel() {
        self.viewModel.showError = { [weak self] error in
            DispatchQueue.main.async {
                self?.showErrorAlert(description: error)
            }
        }
    }
    
    func setupUI() {
        view.backgroundColor = .white
    }
    
    func setNavigationBarTitle() {
        navigationItem.title = viewModel.navigationBarTitle
    }
    
    func setupSubviews() {
        // This method is used to override in child classes
    }
    
    func layoutSubviews() {
        // This method is used to override in child classes
    }
    
}
