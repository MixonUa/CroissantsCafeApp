//
//  PromoViewController.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 15.03.2024.
//

import UIKit

class PromoViewController: UIViewController {
    private let promoCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    private let returnButton = UIButton()
    private let dataProvider = NetworkImageDownloader(networkDataProvider: NetworkService())
    public var promoData = [PromoDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureReturnButton()
        configurePromoCollectionView()
        
        promoCollectionView.register(PromoCollectionViewCell.self, forCellWithReuseIdentifier: PromoCollectionViewCell.reuseId)
        promoCollectionView.dataSource = self
        promoCollectionView.delegate = self
    }

    // MARK: - Navigation
    @objc private func backButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - ViewConfiguration
    private func configureReturnButton() {
        returnButton.setImage(UIImage(named: "back"), for: .normal)
        returnButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        view.addSubview(returnButton)
        returnButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            returnButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            returnButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            returnButton.widthAnchor.constraint(equalToConstant: 40),
            returnButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configurePromoCollectionView() {
        promoCollectionView.backgroundColor = .none
        view.addSubview(promoCollectionView)
        promoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            promoCollectionView.topAnchor.constraint(equalTo: returnButton.bottomAnchor, constant: 40),
            promoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            promoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            promoCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

//MARK: - UICollectionViewDataSource

extension PromoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        promoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoCollectionViewCell.reuseId, for: indexPath) as? PromoCollectionViewCell else { return UICollectionViewCell() }
        dataProvider.requestImagesData(from: promoData[indexPath.row].image) { [unowned self] (result) in
            switch result {
            case .success(let recievedData): cell.configureDataCell(promoData: recievedData)
            case .failure(let recievedError): self.showErrorAlert(title: "ERROR", message: recievedError.localizedDescription)
            }
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension PromoViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.showPromoAlert(promoTitle: promoData[indexPath.row].name, promoCode: "Назвіть касиру код: \(promoData[indexPath.row].code)")
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension PromoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 5, height: collectionView.frame.width / 2 - 5)
    }
}
