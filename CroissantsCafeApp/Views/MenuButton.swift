//
//  MenuButton.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 12.03.2024.
//

import UIKit

class MenuButton: UIButton {
    private let arrowIcon = UIImageView()
    private let menuTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.gray
        layer.cornerRadius = 25
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 3
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(menuTitleLabel)
        menuTitleLabel.text = "Перегянути меню"
        menuTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            menuTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            menuTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            menuTitleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6)
        ])
        
        addSubview(arrowIcon)
        arrowIcon.image = UIImage(named: "arrow")
        arrowIcon.contentMode = .scaleAspectFit
        arrowIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrowIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowIcon.leadingAnchor.constraint(equalTo: menuTitleLabel.trailingAnchor, constant: 5),
            arrowIcon.trailingAnchor.constraint(equalTo: trailingAnchor),
            arrowIcon.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
    }
}
