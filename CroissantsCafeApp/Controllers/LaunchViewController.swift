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
    
    var data = [CroissantsDataModel]()
    var error: Error? = nil
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
            case .success(let recievedData): data = recievedData; print(recievedData.count)
            case .failure(let recievedError): error = recievedError; print(recievedError.localizedDescription)
            }
            group.leave()
        }
        
        group.notify(queue: DispatchQueue.main) { [unowned self] in
            if error == nil {
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
            progressBarTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.updateProgressView), userInfo: nil, repeats: true)
        })
    }
    
    @objc private func updateProgressView(){
        loadingLine.progress += 0.1
        loadingLine.setProgress(loadingLine.progress, animated: true)
        if(loadingLine.progress == 1.0) {
            progressBarTimer?.invalidate()
            progressBarTimer = nil
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
        loadingLine.progress = 0.15
        loadingLine.alpha = 0
        loadingLine.frame = CGRect(x: ((frame.width/2)-120), y: ((frame.height/2)+105), width: 240, height: 30)
        view.addSubview(loadingLine)
    }
    
    // MARK: - Navigation
    private func presentVC() {
        let nextVC = MainViewController()
        nextVC.croissantData = data
        nextVC.modalTransitionStyle = .crossDissolve
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}
