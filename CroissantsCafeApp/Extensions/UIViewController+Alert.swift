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
    
    func showQrCodeAlert(qrTitle: String, image: String) {
        let alertController = UIAlertController(title: qrTitle, message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 55, width: 280, height: 140))
        imageView.image = UIImage(named: image)
        imageView.contentMode = .scaleAspectFit
        alertController.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: alertController.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260)
        alertController.view.addConstraint(height)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    func showPromoAlert(promoTitle: String, promoCode: String) {
        let alertController = UIAlertController(title: promoTitle, message: promoCode, preferredStyle: .alert)
        let action = UIAlertAction(title: "Смакую!", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
