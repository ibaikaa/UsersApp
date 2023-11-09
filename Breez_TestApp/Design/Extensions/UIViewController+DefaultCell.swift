//
//  UIViewController+DefaultCell.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 9/11/23.
//

import UIKit
import SnapKit

extension UIViewController {
    
    func defaultTableViewCell() -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = APIConstants.undefinedError
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.textLabel?.textColor = .black
        
        return cell
    }
    
    func defaultCollectionViewCell() -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        
        let label = errorLabel()
        
        cell.addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        return cell
    }
    
}

fileprivate extension UIViewController {
    
    func errorLabel() -> UILabel {
        let label = UILabel()
        
        label.text = APIConstants.undefinedError
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }
    
}
