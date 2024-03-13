//
//  MenuTableViewCell.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 13.03.2024.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    static let reuseId = "MenuTableViewCell"
    
    private let croissantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "loadingCroissant")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let croissantName: UILabel = {
        let label = UILabel()
        label.text = "NAME"
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    private let croissantPrice: UILabel = {
        let label = UILabel()
        label.text = "PRICE 900"
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    private let triangleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "triangleDown")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let croissantDescription: UILabel = {
       let label = UILabel()
        label.text = "DESCRIPTION description description description description description "
        label.font = UIFont(name: "Helvetica-Regular", size: 14)
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let croissantDetails: UILabel = {
       let label = UILabel()
        label.text = "100 / 500"
        label.font = UIFont(name: "Helvetica-Regular", size: 12)
        label.textColor = UIColor.systemOrange
        label.textAlignment = .center
        return label
    }()
        
    private let rightContainerView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: MenuCellViewModel) {
        croissantName.text = model.croissant.name
        croissantPrice.text = "500грн"
        if model.collapsed {
            croissantDescription.text = "press for details"
            croissantDescription.numberOfLines = 1
            croissantDescription.textAlignment = .center
            croissantDescription.font = UIFont(name: "Helvetica-Oblique", size: 14)
            croissantDetails.isHidden = true
            triangleImageView.image = UIImage(named: "triangleDown")
        } else {
            croissantDescription.text = "here they are det det det det det det det det here they are det det det det det det det det here they are det det det det det det det det here they are det det det det det det det det"
            croissantDescription.numberOfLines = 0
            croissantDescription.textAlignment = .left
            croissantDescription.font = UIFont(name: "Helvetica-Regular", size: 14)
            croissantDetails.isHidden = false
            triangleImageView.image = UIImage(named: "triangleUp")
        }
    }
    
    public func configureCells(with data: CroissantsDataModel) {
        croissantName.text = data.name
        croissantPrice.text = "500грн"
    }

    private func configureViews() {
        addSubview(croissantImageView)
        croissantImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            croissantImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            croissantImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            croissantImageView.widthAnchor.constraint(equalToConstant: 160),
            croissantImageView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        addSubview(rightContainerView)
        rightContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightContainerView.topAnchor.constraint(equalTo: topAnchor),
            rightContainerView.leadingAnchor.constraint(equalTo: croissantImageView.trailingAnchor, constant: 10),
            rightContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            rightContainerView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        rightContainerView.addSubview(croissantName)
        croissantName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            croissantName.topAnchor.constraint(equalTo: rightContainerView.topAnchor),
            croissantName.leadingAnchor.constraint(equalTo: rightContainerView.leadingAnchor),
            croissantName.trailingAnchor.constraint(equalTo: rightContainerView.trailingAnchor),
            croissantName.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        rightContainerView.addSubview(croissantPrice)
        croissantPrice.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            croissantPrice.bottomAnchor.constraint(equalTo: rightContainerView.bottomAnchor),
            croissantPrice.leadingAnchor.constraint(equalTo: rightContainerView.leadingAnchor),
            croissantPrice.trailingAnchor.constraint(equalTo: rightContainerView.trailingAnchor),
            croissantPrice.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        addSubview(triangleImageView)
        triangleImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            triangleImageView.centerYAnchor.constraint(equalTo: rightContainerView.centerYAnchor),
            triangleImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            triangleImageView.widthAnchor.constraint(equalToConstant: 20),
            triangleImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        addSubview(croissantDescription)
        croissantDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            croissantDescription.topAnchor.constraint(equalTo: rightContainerView.bottomAnchor, constant: 5),
            croissantDescription.leadingAnchor.constraint(equalTo: rightContainerView.leadingAnchor),
            croissantDescription.trailingAnchor.constraint(equalTo: rightContainerView.trailingAnchor)
        ])
        
        addSubview(croissantDetails)
        croissantDetails.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            croissantDetails.topAnchor.constraint(equalTo: croissantDescription.bottomAnchor),
            croissantDetails.bottomAnchor.constraint(equalTo: bottomAnchor),
            croissantDetails.leadingAnchor.constraint(equalTo: rightContainerView.leadingAnchor),
            croissantDetails.trailingAnchor.constraint(equalTo: rightContainerView.trailingAnchor),
            croissantDetails.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
