//
//  AuthPresenter.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 15.11.2021.
//

import Foundation
import UIKit

protocol AuthViewProtocol: AnyObject {
    func showAlert(message: String)
    func gotoMainTabBar()
}

protocol AuthPresenterProtocol {
    init(view: AuthViewProtocol)
    func login(phone: String, password: String)
    func forgotPasswordDidTap()
    func signUpDidTap()
}

class AuthPresenter: AuthPresenterProtocol {
    
    weak var view: AuthViewProtocol?
    
    required init(view: AuthViewProtocol) {
        self.view = view
    }
    
    func login(phone: String, password: String) {
        // validate data
        // view?.showAlert(message: "Fuck!")
        
        // login firebase
        print("\(phone), \(password)")
        // go to tabbar
        view?.gotoMainTabBar()
        
        
    }
    
    func forgotPasswordDidTap() {
        
    }
    
    func signUpDidTap() {
        // buildSignUpModule and present
    }
}
