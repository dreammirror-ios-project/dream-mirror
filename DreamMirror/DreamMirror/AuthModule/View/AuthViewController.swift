//
//  AuthViewController.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 15.11.2021.
//

import UIKit

class AuthViewController: UIViewController {

    var presenter: AuthPresenterProtocol!
    
    // MARK: - UI elements
    // TODO: UI components
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray
        return imageView
    }()
    
    private let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите номер телефона..."
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите пароль..."
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.configuration?.title = "Забыли пароль?"
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.configuration?.title = "Регистрация"
        return button
    }()
    
    // MARK: - StackViews
    private var buttonsStackView = UIStackView()
    private var fieldsStackView = UIStackView()
    private var mainStackView = UIStackView()
    
    // MARK: - VC Lifecycleqas
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        phoneTextField.delegate = self
        passwordTextField.delegate = self
        
        addSubviews()
        addConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Helpers functions
    func addSubviews() {
        buttonsStackView = UIStackView(arrangedSubviews: [forgotPasswordButton, signUpButton],
                                       axis: .vertical,
                                       spacing: 0,
                                       distribution: .fillEqually)
        
        fieldsStackView = UIStackView(arrangedSubviews: [phoneTextField, passwordTextField],
                                      axis: .vertical,
                                      spacing: 7, distribution: .fillProportionally)
        
        mainStackView = UIStackView(arrangedSubviews: [fieldsStackView, buttonsStackView],
                                    axis: .vertical,
                                    spacing: 14, distribution: .fillProportionally,
                                    alignment: .center)
        
        view.addSubview(logoImageView)
        view.addSubview(mainStackView)
        
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            mainStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            
            fieldsStackView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 0.7),
            
            logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            logoImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor),
        ])
    }
}

extension AuthViewController: AuthViewProtocol {
    func showAlert(message: String) {
        let alert = AlertService.alert(title: nil, message: message)
        present(alert, animated: true, completion: nil)
    }
    
    
}

extension AuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.phoneTextField {
            self.passwordTextField.becomeFirstResponder()
        } else if textField == self.passwordTextField {
            presenter.login(phone: phoneTextField.text ?? "", password: passwordTextField.text ?? "")
        }
        return true
    }
}
