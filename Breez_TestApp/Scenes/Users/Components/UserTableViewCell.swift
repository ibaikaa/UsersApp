//
//  UserTableViewCell.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 8/11/23.
//

import UIKit
import SnapKit

final class UserTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: UserTableViewCell.self)
        
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        
        view.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.textAlignment = .center
        
        return view
    }()
    
    private lazy var nameView: TextWithIconView = {
        TextWithIconView(title: "Name: ", icon: .person)
    }()
    
    private lazy var emailView: TextWithIconView = {
        TextWithIconView(title: "Email: ", icon: .email, iconColor: .brown)
    }()
    
    private lazy var cityView: TextWithIconView = {
        TextWithIconView(title: "City: ", icon: .city, iconColor: .orange)
    }()
    
    private lazy var zipcodeView: TextWithIconView = {
        TextWithIconView(title: "Zip code: ", icon: .zipcode, iconColor: .red)
    }()
    
    private lazy var companyView: TextWithIconView = {
        TextWithIconView(title: "Company: ", icon: .company, iconColor: .lightGray)
    }()
    
    private lazy var userInfoStackView: UIStackView = {
        let view = UIStackView(
            arrangedSubviews: [nameView, emailView, cityView, zipcodeView, companyView]
        )
        
        view.axis = .vertical
        view.spacing = 40
    
        return view
    }()
    
    public func updateContent(with model: UserDTO) {
        self.nameLabel.text = model.name
        
        self.nameView.updateTitle(with: "Username: \(model.username)")
        self.emailView.updateTitle(with: "Email: \(model.email)")
        self.cityView.updateTitle(with: "City: \(model.address.city)")
        self.zipcodeView.updateTitle(with: "Zip Code: \(model.address.zipcode)")
        self.companyView.updateTitle(with: "Company: \(model.company.name)")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        selectionStyle = .none
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview()
        }
        
        addSubview(userInfoStackView)
        userInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
}
