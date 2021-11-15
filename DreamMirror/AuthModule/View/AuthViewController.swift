//
//  AuthViewController.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 15.11.2021.
//

import UIKit

class AuthViewController: UIViewController {

    // MARK: - UI elements
    // TODO: UI components
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray
        return imageView
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
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
    
    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        addSubviews()
        addConstraints()
    }
    
    // MARK: - Helpers functions
    func addSubviews() {
        buttonsStackView = UIStackView(arrangedSubviews: [forgotPasswordButton, signUpButton],
                                       axis: .vertical,
                                       spacing: 0,
                                       distribution: .fillEqually)
        
        fieldsStackView = UIStackView(arrangedSubviews: [loginTextField, passwordTextField],
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
