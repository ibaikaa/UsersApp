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
        self.viewModel.showLoading = { [weak self] isLoading in
            DispatchQueue.main.async {
                isLoading ? self?.showLoader() : self?.hideLoader()
            }
        }
        
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
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        
        view.isHidden = true
        
        return view
    }()
    
    private func showLoader() {
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        for subview in view.subviews where subview != activityIndicator {
            subview.isHidden = true
        }
        
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    private func hideLoader() {
        activityIndicator.stopAnimating()
        
        for subview in view.subviews where subview != activityIndicator {
            subview.isHidden = false
        }
        
        activityIndicator.removeFromSuperview()
    }
    
    private func showErrorAlert(description: String) {
        let alert = UIAlertController(
            title: "Error",
            message: description,
            preferredStyle: .alert
        )
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default
            )
        )
        
        present(alert, animated: true)
    }
    
}
