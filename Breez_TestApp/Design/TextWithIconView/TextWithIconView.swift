//
//  TextWithIconView.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 8/11/23.
//

import UIKit
import SnapKit

final class TextWithIconView: UIView {
    
    let title: String
    let fontSize: CGFloat
    let fontColor: UIColor
    let fontWeight: UIFont.Weight
    let icon: AppImage
    let iconColor: UIColor
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = title
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        label.textColor = fontColor
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = AppImages.getSystemImage(from: icon)
        view.tintColor = iconColor
        
        return view
    }()
    
    init(
        title: String,
        fontSize: CGFloat = 14,
        fontWeight: UIFont.Weight = .regular,
        fontColor: UIColor = .black,
        icon: AppImage,
        iconColor: UIColor = .black
    ) {
        self.title = title
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.fontColor = fontColor
        self.icon = icon
        self.iconColor = iconColor
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.height.width.equalTo(24)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(10)
            make.centerY.equalTo(imageView.snp.centerY)
        }
    }
    
    public func updateTitle(with title: String?) {
        self.titleLabel.text = title
    }
    
}
