//
//  LaunchViewController.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 11.03.2024.
//

import UIKit

class LaunchViewController: UIViewController {
    let frame = UIScreen.main.bounds

    let loadingCoffe = UIImageView(image: UIImage(named: "loadingCoffe"))
    let loadingCroissant = UIImageView(image: UIImage(named: "loadingCroissant"))
    let loadingLabel = UILabel()
    let loadingLine = UIProgressView()
    var progressBarTimer: Timer?
    
    var croissantData = [CroissantsDataModel]()
    var croissantError: Error? = nil
    var promoData = [PromoDataModel]()
    var promoError: Error? = nil
    var menuImageData = [String:Data]()
    var menuImageError: Error? = nil
    let fetchDataProvider = NetworkFetchService(networkDataProvider: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        configureLoadingImages()
        configureLoadingLabel()
        configureLoadingLine()
        
        let group = DispatchGroup()
        group.enter()
        fetchDataProvider.requestCroissantsData { [unowned self] result in
            switch result {
            case .success(let recievedData): croissantData = recievedData
            case .failure(let recievedError): croissantError = recievedError
            }
            group.leave()
        }
        
        group.enter()
        fetchDataProvider.requestPromoData { [unowned self] result in
            switch result {
            case .success(let recievedData): promoData = recievedData
            case .failure(let recievedError): promoError = recievedError
            }
            group.leave()
        }
        
        group.notify(queue: DispatchQueue.main) { [unowned self] in
            let dataProvider = NetworkImageDownloader(networkDataProvider: NetworkService())
            for croissant in croissantData {
                dataProvider.requestImagesData(from: croissant.image) { [unowned self] (result) in
                    switch result {
                    case .success(let recievedData): menuImageData[croissant.name] = recievedData
                    case .failure(let recievedError): menuImageError = recievedError; break
                    }
                }
            }
            if croissantError == nil && promoError == nil && menuImageError == nil {
            loadingLine.progress += 0.2
            loadingLine.setProgress(loadingLine.progress, animated: true)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animateKeyframes(withDuration: 3.0, delay: 0.5, options: .calculationModeLinear, animations: {
            self.loadingCroissant.frame.origin.x = self.view.bounds.width/2-50
            self.loadingCoffe.frame.origin.x = self.view.bounds.width/2-100
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.7) { [unowned self] in
                loadingCoffe.alpha = 1
                loadingCroissant.alpha = 1
                loadingLabel.alpha = 1
            }
        }, completion: {[unowned self] _ in
            loadingLine.alpha = 1
            guard progressBarTimer == nil else { return }
            var timeInterval = 0.5
            for _ in 0...3 {
                progressBarTimer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(self.updateProgressView), userInfo: nil, repeats: false)
                timeInterval += 0.5
            }
        })
    }
    
    @objc private func updateProgressView(){
        loadingLine.progress += 0.2
        loadingLine.setProgress(loadingLine.progress, animated: true)
        if (loadingLine.progress == 0.8) {
            if let error = croissantError { self.showErrorAlert(title: "ERROR: MenuJSON", message: error.localizedDescription) }
            else if let promoError = promoError { self.showErrorAlert(title: "ERROR: PromoJSON", message: promoError.localizedDescription) }
            else if let imageError = menuImageError { self.showErrorAlert(title: "ERROR: MenuImages", message: imageError.localizedDescription) }
        }
        else if (loadingLine.progress == 1.0) {
            presentVC()
        }
    }
    
    
    // MARK: - ViewConfiguration
    private func configureLoadingImages() {
        loadingCoffe.contentMode = .scaleAspectFill
        loadingCoffe.alpha = 0.1
        loadingCoffe.frame = CGRect(x: (frame.width), y: ((frame.height/2)-120), width: 100, height: 180)
        view.addSubview(loadingCoffe)

        loadingCroissant.contentMode = .scaleAspectFit
        loadingCroissant.alpha = 0.1
        loadingCroissant.frame = CGRect(x: -180, y: ((frame.height/2)-90), width: 180, height: 180)
        view.addSubview(loadingCroissant)
        }
    
    private func configureLoadingLabel() {
        loadingLabel.text = "Готуємо запашні смаколики"
        loadingLabel.textColor = .white
        loadingLabel.textAlignment = .center
        loadingLabel.font = UIFont(name: "Noteworthy", size: 20)
        loadingLabel.alpha = 0
        loadingLabel.frame = CGRect(x: 0, y: ((frame.height/2)+50), width: frame.width, height: 60)
        view.addSubview(loadingLabel)
    }
    
    private func configureLoadingLine() {
        loadingLine.progress = 0.0
        loadingLine.alpha = 0
        loadingLine.frame = CGRect(x: ((frame.width/2)-120), y: ((frame.height/2)+105), width: 240, height: 30)
        view.addSubview(loadingLine)
    }
    
    // MARK: - Navigation
    private func presentVC() {
        let nextVC = MainViewController()
        nextVC.croissantData = croissantData
        nextVC.promoData = promoData
        nextVC.menuImageData = menuImageData
        nextVC.modalTransitionStyle = .crossDissolve
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}
