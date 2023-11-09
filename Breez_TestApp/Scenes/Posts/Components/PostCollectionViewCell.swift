//
//  PostCollectionViewCell.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 9/11/23.
//

import UIKit

protocol PostCollectionViewCellDelegate: AnyObject {
    func handleInfoButtonTapped(postId: Int, username: String)
}

final class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: PostCollectionViewCell.self)
    
    weak var delegate: PostCollectionViewCellDelegate?
    
    private var postId = Int()
    private var username = String()
    
    private lazy var userInfoView: TextWithIconView = {
        TextWithIconView(
            title: "Username",
            fontSize: 18,
            fontWeight: .bold,
            fontColor: .white,
            icon: .person,
            iconColor: .white
        )
    }()
    
    private lazy var infoButton: UIButton = {
        let tapAction = UIAction { [weak self] _ in
            guard let self else {
                print("Error. PostCollectionViewCell is nil.")
                
                return
            }
            
            self.delegate?.handleInfoButtonTapped(postId: self.postId, username: self.username)
        }
        
        return UIButton(type: .infoLight, primaryAction: tapAction)
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        
        view.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.numberOfLines = 2
        view.lineBreakMode = .byWordWrapping
        view.textColor = .white
        
        return view
    }()
    
    private lazy var positionLabel: UILabel = {
        let view = UILabel()
        
        view.font = UIFont.systemFont(ofSize: 14, weight: .light)
        view.textAlignment = .right
        view.textColor = .lightGray
        
        return view
    }()
    
    public func updateContent(username: String, post: PostDTO) {
        self.postId = post.id
        self.username = username
        
        userInfoView.updateTitle(with: username)
        titleLabel.text = post.title
        positionLabel.text = "Position #\(post.id)"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupUI()
        setupSubviews()
    }
    
    private func setupUI() {
        backgroundColor = .black
        layer.cornerRadius = 24
    }
    
    private func setupSubviews() {
        addSubview(userInfoView)

        userInfoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
        }
        
        addSubview(infoButton)
        infoButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalTo(userInfoView.snp.centerX)
            make.right.equalToSuperview().inset(16)
        }

        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(userInfoView.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        addSubview(positionLabel)
        positionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
}

