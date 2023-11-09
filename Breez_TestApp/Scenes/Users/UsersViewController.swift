//
//  UsersViewController.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 8/11/23.
//

import UIKit
import SnapKit

final class UsersViewController: BaseViewController<UsersViewModel> {
    
    // MARK: Properties
    
    private lazy var usersTableView: UITableView = {
        UITableView()
    }()
    
    // MARK: Methods
    
    override func initViewModel() {
        super.initViewModel()
        
        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.usersTableView.reloadData()
            }
        }
    }
    
    override func setupSubviews() {
        usersTableView.dataSource = self
        usersTableView.delegate = self
        
        usersTableView.register(
            UserTableViewCell.self,
            forCellReuseIdentifier: UserTableViewCell.identifier
        )
    }
    
    override func layoutSubviews() {
        view.addSubview(usersTableView)
        usersTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        usersTableView.bounces = false
        usersTableView.showsVerticalScrollIndicator = false
    }
    
}

// MARK: - UITableViewDataSource

extension UsersViewController: UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: UserTableViewCell.identifier,
            for: indexPath
        ) as? UserTableViewCell else {
            print("Error: Could not dequeue a UserTableViewCell.")
            
            return defaultTableViewCell()
        }
        
        guard let user = viewModel.user(at: indexPath) else {
            print("Error. User at IndexPath \(indexPath) is nil")
            
            return defaultTableViewCell()
        }
        
        cell.updateContent(with: user)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension UsersViewController: UITableViewDelegate {
        
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        guard let selectedUser = viewModel.user(at: indexPath) else {
            print("Error. Selected User at IndexPath \(indexPath) is nil")
            
            return
        }
        
        let vc = PostsBuilder.create(
            id: selectedUser.id,
            name: selectedUser.name,
            username: selectedUser.username
        )
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return UIScreen.main.bounds.height * 0.3
    }
    
}
