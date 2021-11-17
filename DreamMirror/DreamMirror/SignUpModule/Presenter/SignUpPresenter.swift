//
//  SignUpPresenter.swift
//  DreamMirror
//
//  Created by Андрей Суханов on 17.11.2021.
//

import Foundation
import UIKit

protocol SignUpViewProtocol: AnyObject {
    func showAlert(message: String)
}

protocol SignUpPresenterProtocol {
    init(view: SignUpViewProtocol, router: RouterProtocol)
    func signUp(phone: String, password: String)
    
}

class SignUpPresenter: SignUpPresenterProtocol {
    
    weak var view: SignUpViewProtocol?
    var router: RouterProtocol
    
    required init(view: SignUpViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func signUp(phone: String, password: String) {
        // validate data
        // view?.showAlert(message: "Fuck!")
        
        // login firebase
        print("\(phone), \(password)")
        // go to tabbar
        router.showMainTabBarController()
    }
    

}
