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
        imageView.image = UIImage(named: Constants.UI.ImagesNames.logo)
        return imageView
    }()
    
    private let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.styleWith("+7(495)090-60-90")
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.styleWith("Пароль")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.stylePlainWith("Забыли пароль?")
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.stylePlainWith("Регистрация")
        button.addTarget(self, action: #selector(signUpButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - StackViews
    private var buttonsStackView = UIStackView()
    private var fieldsStackView = UIStackView()
    private var mainStackView = UIStackView()
    private var formStackView = UIStackView()
    
    // MARK: - VC Lifecycle
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
        
        formStackView = UIStackView(arrangedSubviews: [fieldsStackView, buttonsStackView],
                                    axis: .vertical,
                                    spacing: 14, distribution: .fillProportionally,
                                    alignment: .center)
        
        mainStackView = UIStackView(arrangedSubviews: [logoImageView, formStackView],
                                    axis: .vertical,
                                    spacing: 30,
                                    distribution: .fill,
                                    alignment: .center)
        
        view.addSubview(mainStackView)
        
    }
    
    func addConstraints() {
        mainStackView.spacing = view.frame.height / 8
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            formStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            formStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            formStackView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor),
            
            fieldsStackView.widthAnchor.constraint(equalTo: formStackView.widthAnchor, multiplier: 0.7),
            
//            logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            logoImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
        ])
    }
    
    @objc
    func signUpButtonDidTap() {
        presenter.signUpDidTap()
    }
}

extension AuthViewController: AuthViewProtocol {
    
    func showErrorAlert(message: String) {
        showAlert(title: nil, message: message)
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
