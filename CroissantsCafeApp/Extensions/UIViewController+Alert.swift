//
//  UIViewController+Alert.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 13.03.2024.
//

import Foundation
import UIKit

extension UIViewController {
    func showErrorAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Exit", style: .default) { (_) in
            exit(0)
        }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
