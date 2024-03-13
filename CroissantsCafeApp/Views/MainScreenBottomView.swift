//
//  MainScreenBottomView.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 12.03.2024.
//

import UIKit

class MainScreenBottomView: UIView {
    private let centralCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 111/255, green: 166/255, blue: 94/255, alpha: 1)
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        view.layer.shadowOpacity = 1.0
        view.layer.cornerRadius = 50
        return view
    }()
    
    private let menuCenterButon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "qr"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
       return button
    }()
    
    private let promoLeftButon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "promo"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
       return button
    }()
    
    private let adressRightButon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "map"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
       return button
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
        addSubview(centralCircleView)
        centralCircleView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    centralCircleView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -30),
                    centralCircleView.centerXAnchor.constraint(equalTo: centerXAnchor),
                    centralCircleView.widthAnchor.constraint(equalToConstant: 100),
                    centralCircleView.heightAnchor.constraint(equalToConstant: 100)
                ])
        
        addSubview(menuCenterButon)
        menuCenterButon.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    menuCenterButon.centerYAnchor.constraint(equalTo: centralCircleView.centerYAnchor),
                    menuCenterButon.centerXAnchor.constraint(equalTo: centralCircleView.centerXAnchor),
                    menuCenterButon.widthAnchor.constraint(equalToConstant: 60),
                    menuCenterButon.heightAnchor.constraint(equalToConstant: 60)
                ])
        
        addSubview(promoLeftButon)
        promoLeftButon.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    promoLeftButon.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
                    promoLeftButon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
                    promoLeftButon.widthAnchor.constraint(equalToConstant: 60),
                    promoLeftButon.heightAnchor.constraint(equalToConstant: 40)
                ])
        
        addSubview(adressRightButon)
        adressRightButon.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    adressRightButon.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
                    adressRightButon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
                    adressRightButon.widthAnchor.constraint(equalToConstant: 60),
                    adressRightButon.heightAnchor.constraint(equalToConstant: 40)
                ])
    }
}
