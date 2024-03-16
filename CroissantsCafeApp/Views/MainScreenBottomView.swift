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
    
    public let qrCodeCenterButon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "qr"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
       return button
    }()
    
    public let promoLeftButon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "promo"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
       return button
    }()
    
    public let profileRightButon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profile"), for: .normal)
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
        
        addSubview(qrCodeCenterButon)
        qrCodeCenterButon.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    qrCodeCenterButon.centerYAnchor.constraint(equalTo: centralCircleView.centerYAnchor),
                    qrCodeCenterButon.centerXAnchor.constraint(equalTo: centralCircleView.centerXAnchor),
                    qrCodeCenterButon.widthAnchor.constraint(equalToConstant: 60),
                    qrCodeCenterButon.heightAnchor.constraint(equalToConstant: 60)
                ])
        
        addSubview(promoLeftButon)
        promoLeftButon.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    promoLeftButon.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
                    promoLeftButon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
                    promoLeftButon.widthAnchor.constraint(equalToConstant: 60),
                    promoLeftButon.heightAnchor.constraint(equalToConstant: 40)
                ])
        
        addSubview(profileRightButon)
        profileRightButon.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    profileRightButon.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
                    profileRightButon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
                    profileRightButon.widthAnchor.constraint(equalToConstant: 60),
                    profileRightButon.heightAnchor.constraint(equalToConstant: 40)
                ])
    }
}
