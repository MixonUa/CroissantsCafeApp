//
//  MainScreenTopView.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 12.03.2024.
//

import UIKit

class MainScreenTopView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "CROISSANT CAFFE"
        label.font = UIFont(name: "Helvetica-Bold", size: 30)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    init() {
        super .init(frame: .zero)
        backgroundColor = UIColor(red: 88/255, green: 134/255, blue: 74/255, alpha: 1)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
                    titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                    titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                    titleLabel.heightAnchor.constraint(equalToConstant: 50)
                ])
    }
}
