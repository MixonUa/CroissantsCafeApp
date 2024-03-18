//
//  FullMenuViewController.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 13.03.2024.
//

import UIKit

class FullMenuViewController: UIViewController {
    private let menuTableView = UITableView()
    
    private var cellModel = [MenuCellViewModel]()
    public var croissantData = [CroissantsDataModel]()
    public var menuImageData = [String:Data]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMenuTableView()
        
        cellModel = setupViewModel(croissantData)
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.reuseId)
    }
    
    private func setupViewModel(_ data: [CroissantsDataModel]) -> [MenuCellViewModel] {
        data.map { data in
            MenuCellViewModel(croissant: data, collapsed: true, pressHandler: { croissant in
                if let index = self.cellModel.firstIndex(where: { $0.croissant.name == croissant.name }) {
                    var model = self.cellModel[index]
                    let current = model.collapsed
                    model.collapsed = !current
                    self.cellModel[index] = model
                    let indexPath = IndexPath(row: index, section: 0)
                    self.menuTableView.reloadRows(at: [indexPath], with: .automatic)
                }
            })
        }
    }
    
    private func configureMenuTableView() {
        view.addSubview(menuTableView)
        menuTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuTableView.topAnchor.constraint(equalTo: view.topAnchor),
            menuTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

//MARK: - UITableViewDelegate & UITableViewDataSource
extension FullMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return croissantData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseId, for: indexPath) as! MenuTableViewCell
        let model = cellModel[indexPath.row]
        guard let image = menuImageData[model.croissant.name] else { return cell }
        cell.configureCellImages(from: image)
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = cellModel[indexPath.row]
            model.pressHandler(model.croissant)
    }
    
}
