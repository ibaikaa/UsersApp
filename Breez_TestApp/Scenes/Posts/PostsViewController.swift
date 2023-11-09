//
//  PostsViewController.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 8/11/23.
//

import UIKit

final class PostsViewController: BaseViewController<PostsViewModel> {
    
    // MARK: Properties
    
    private lazy var postsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return view
    }()
    
    // MARK: UIViewController Lifecycle
    
    override func initViewModel() {
        super.initViewModel()
        
        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.postsCollectionView.reloadData()
            }
        }
    }
    
    override func setupSubviews() {
        postsCollectionView.dataSource = self
        postsCollectionView.delegate = self
        
        postsCollectionView.register(
            PostCollectionViewCell.self,
            forCellWithReuseIdentifier: PostCollectionViewCell.identifier
        )
    }
    
    override func layoutSubviews() {
        view.addSubview(postsCollectionView)
        postsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalToSuperview()
        }
        
        postsCollectionView.bounces = false
        postsCollectionView.showsVerticalScrollIndicator = false
    }
    
}

// MARK: - UICollectionViewDataSource

extension PostsViewController: UICollectionViewDataSource, PostCollectionViewCellDelegate {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PostCollectionViewCell.identifier,
            for: indexPath
        ) as? PostCollectionViewCell else {
            print("Error: Could not dequeue a PostCollectionViewCell.")
            
            return defaultCollectionViewCell()
        }
        
        guard let post = viewModel.post(at: indexPath) else {
            print("Error. Post at IndexPath \(indexPath) is nil")
            
            return defaultCollectionViewCell()
        }
        
        cell.updateContent(username: viewModel.username(), post: post)
        
        cell.delegate = self
        
        return cell
    }
    
    func handleInfoButtonTapped(postId: Int, username: String) {
        let vc = PostDetailedBuilder.create(postId: postId, username: username)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PostsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = UIScreen.main.bounds.width - 32
        let height = UIScreen.main.bounds.height / 7

        return CGSize(width: width, height: height)
    }

}

// MARK: - PostCollectionViewCellDelegate
