//
//  GalleryCollectionViewCell.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 11.03.2024.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    static let reuseId = "GalleryCollectionViewCell"
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = 5
        return stack
    }()
    
    let croissantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "loadingCroissant")
        imageView.contentMode = .scaleAspectFit
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
        label.text = "DESCRIPTION description description description description description "
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
        
        configureStackView()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        addSubview(stackView)
        stackView.addArrangedSubview(croissantImageView)
        stackView.addArrangedSubview(croissantName)
        stackView.addArrangedSubview(croissantDescription)
        stackView.addArrangedSubview(croissantDetails)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureViews() {
        croissantImageView.translatesAutoresizingMaskIntoConstraints = false
        
        croissantName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            croissantName.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        croissantDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            croissantDescription.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        croissantDetails.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            croissantDetails.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
