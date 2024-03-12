//
//  GalleryCollectionViewCell.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 11.03.2024.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    static let reuseId = "GalleryCollectionViewCell"
    
    let croissantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "loadingCroissant")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.systemPink
        return imageView
    }()
    
    let croissantName: UILabel = {
        let label = UILabel()
        label.text = "NAME"
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    let croissantDescription: UILabel = {
       let label = UILabel()
        label.text = "DESCRIPTION description description description description description descriptio"
        label.font = UIFont(name: "Helvetica-Regular", size: 14)
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let croissantDetails: UILabel = {
       let label = UILabel()
        label.text = "100 / 500"
        label.font = UIFont(name: "Helvetica-Regular", size: 12)
        label.textColor = UIColor.systemOrange
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        addSubview(croissantImageView)
        croissantImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            croissantImageView.topAnchor.constraint(equalTo: topAnchor),
            croissantImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            croissantImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            croissantImageView.heightAnchor.constraint(equalTo: widthAnchor)
        ])
        
        addSubview(croissantName)
        croissantName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            croissantName.topAnchor.constraint(equalTo: croissantImageView.bottomAnchor, constant: 4),
            croissantName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            croissantName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            croissantName.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        addSubview(croissantDetails)
        croissantDetails.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            croissantDetails.heightAnchor.constraint(equalToConstant: 20),
            croissantDetails.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            croissantDetails.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            croissantDetails.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
        addSubview(croissantDescription)
        croissantDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            croissantDescription.topAnchor.constraint(equalTo: croissantName.bottomAnchor),
            croissantDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            croissantDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            croissantDescription.bottomAnchor.constraint(equalTo: croissantDetails.topAnchor, constant: -2)
        ])
    }
}
