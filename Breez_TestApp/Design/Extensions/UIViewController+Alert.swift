//
//  ViewController+Alert.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 8/11/23.
//

import UIKit

extension UIViewController {
    
    func showErrorAlert(description: String) {
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
