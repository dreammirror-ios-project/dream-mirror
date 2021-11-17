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
}

protocol AuthPresenterProtocol {
    init(view: AuthViewProtocol, router: RouterProtocol)
    func login(phone: String, password: String)
    func forgotPasswordDidTap()
    func signUpDidTap()
}

class AuthPresenter: AuthPresenterProtocol {
    
    weak var view: AuthViewProtocol?
    var router: RouterProtocol
    
    required init(view: AuthViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func login(phone: String, password: String) {
        // validate data
        // view?.showAlert(message: "Fuck!")
        
        // login firebase
        print("\(phone), \(password)")
        // go to tabbar
        router.showMainTabBarController()
    }
    
    func forgotPasswordDidTap() {
        
    }
    
    func signUpDidTap() {
        // buildSignUpModule and present
    }
}
