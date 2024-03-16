//
//  PromoCollectionViewCell.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 15.03.2024.
//

import UIKit

class PromoCollectionViewCell: UICollectionViewCell {
    static let reuseId = "PromoCollectionViewCell"
    
    private let promoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setImage(promoName: String) {
        promoImage.image = UIImage(named: promoName)
    }
    
    public func configureCell(promoName: String) {
        setImage(promoName: promoName)
    }
    
    private func configure() {
        contentView.backgroundColor = .gray
        contentView.alpha = 0.5
        contentView.layer.cornerRadius = 10
        
        addSubview(promoImage)
        promoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            promoImage.topAnchor.constraint(equalTo: topAnchor),
            promoImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            promoImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            promoImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
