//
//  ProfileViewController.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 18.03.2024.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    private let returnButton = UIButton()
    private let titleLabel = UILabel()
    private let nameLabel = UILabel()
    private let textFieldNameLabel = UILabel()
    private let textField = UITextField(frame: CGRect.init(x: 0, y: 0, width: 300, height: 40))
    
    private let storage = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setName()
        
        configureReturnButton()
        configureTitleLabel()
        configureNameLabel()
        configureTextFieldNameLabel()
        configureTextField()
    }
    
    // MARK: - Navigation
    @objc private func backButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK:- UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let inputName = textField.text else { return }
        storage.setValue(inputName, forKey: "Name")
        setName()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func setName() {
        nameLabel.text = "Давайте познайомимось!"
        guard let name = storage.value(forKey: "Name") else { return }
        if name as! String == "" {
            nameLabel.text = "Давайте познайомимось!"
        } else {
            nameLabel.text = "Вітаю, \(name)"
        }
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
    
    private func configureTitleLabel() {
        titleLabel.text = "Ваш профіль"
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 20)
        titleLabel.textAlignment = .center
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: returnButton.trailingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureNameLabel() {
        nameLabel.font = UIFont(name: "Helvetica-Regular", size: 18)
        nameLabel.textAlignment = .center
        
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    private func configureTextFieldNameLabel() {
        textFieldNameLabel.text = "Вкажіть Ваше ім'я"
        textFieldNameLabel.font = UIFont(name: "Helvetica-Regular", size: 16)
        textFieldNameLabel.textAlignment = .center
        
        view.addSubview(textFieldNameLabel)
        textFieldNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFieldNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            textFieldNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textFieldNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textFieldNameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureTextField() {
        textField.placeholder = "Enter text here"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.delegate = self
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        ])
    }
    

}
