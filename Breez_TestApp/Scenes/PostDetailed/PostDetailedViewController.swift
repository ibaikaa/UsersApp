//
//  PostDetailedViewController.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 9/11/23.
//

import UIKit

final class PostDetailedViewController: BaseViewController<PostDetailedViewModel> {
    
    // MARK: Properties
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.textColor = .black
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0
        
        return view
    }()
    
    private lazy var bodyLabel: UILabel = {
        let view = UILabel()
        
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.textColor = .black
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0
        
        return view
    }()
    
    // MARK: Methods

    override func initViewModel() {
        super.initViewModel()
        
        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.titleLabel.text = self?.viewModel.post()?.title
                self?.bodyLabel.text = self?.viewModel.post()?.body
            }
        }
    }
    
    override func setupSubviews() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }

        view.addSubview(bodyLabel)
        bodyLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }
    }
    
}
