//
//  SignUpViewController.swift
//  DreamMirror
//
//  Created by Андрей Суханов on 15.11.2021.
//

import UIKit


class SignUpViewController: UIViewController {

    var presenter: SignUpPresenterProtocol!
    
    // MARK: UI elements
    // TODO UI Components
    private let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.styleWith("+7(495)090-60-90")
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.styleWith("Chup@piMuniania")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let passwordConfirmTextField: UITextField = {
        let textField = UITextField()
        textField.styleWith("Chup@piMuniania")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер телефона"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let passwordConfirmLabel: UILabel = {
        let label = UILabel()
        label.text = "Повторите пароль"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let registerButton: UIButton = {
       let button = UIButton()
        button.stylePlainWith("Зарегистрироваться")
       return button
    }()
  
    // MARK: - StackViews
    private var phoneStackView = UIStackView()
    private var passwordStackView = UIStackView()
    private var passwordConfirmStackView = UIStackView()
    private var formStackView = UIStackView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Регистрация"
        view.backgroundColor = Constants.UI.Colors.primary
        phoneTextField.delegate = self
        passwordTextField.delegate = self
        
        addSubviews()
        addConstraints()
    }
    
    // MARK: - Helpers functions
    func addSubviews() {
        phoneStackView = UIStackView(arrangedSubviews: [phoneNumberLabel, phoneTextField],
                                     axis: .vertical,
                                     spacing: 3,
                                     distribution: .fill)
        passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField],
                                        axis: .vertical,
                                        spacing: 3,
                                        distribution: .fill)
        passwordConfirmStackView = UIStackView(arrangedSubviews: [passwordConfirmLabel, passwordConfirmTextField],
                                               axis: .vertical,
        spacing: 3,
                                               distribution: .fill)
        formStackView = UIStackView(arrangedSubviews: [phoneStackView, passwordStackView, passwordConfirmStackView],
                                    axis: .vertical,
        spacing: 20,
                                    distribution: .fill)
        
        view.addSubview(formStackView)
        view.addSubview(registerButton)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            formStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            formStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            formStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            
            registerButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: formStackView.bottomAnchor,
                                               constant: 80)
            
            
        ])
    }
}

extension SignUpViewController: SignUpViewProtocol {
    func showAlert(message: String) {
        let alert = AlertService.alert(title: nil, message: message)
        present(alert, animated: true, completion: nil)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldsAreNotEmpty() {
        // Working in progress
    }
}
