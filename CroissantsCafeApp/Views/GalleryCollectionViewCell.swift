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
        return imageView
    }()
    
    let croissantName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    let croissantDescription: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Helvetica-Regular", size: 14)
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let croissantDetails: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Helvetica-Regular", size: 14)
        label.textColor = UIColor.systemOrange
        label.textAlignment = .center
        return label
    }()
    
    let detailsStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureDetailsStackView()
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
            croissantName.topAnchor.constraint(equalTo: croissantImageView.bottomAnchor, constant: 20),
            croissantName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            croissantName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            croissantName.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        addSubview(detailsStackView)
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsStackView.topAnchor.constraint(equalTo: croissantName.bottomAnchor, constant: 20),
            detailsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            detailsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            detailsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureDetailsStackView() {
        detailsStackView.addArrangedSubview(croissantDescription)
        detailsStackView.addArrangedSubview(croissantDetails)
        
        detailsStackView.axis = .vertical
        detailsStackView.spacing = 10
    }
}
