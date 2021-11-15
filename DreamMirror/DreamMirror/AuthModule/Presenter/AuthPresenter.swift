//
//  AuthPresenter.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 15.11.2021.
//

import Foundation

protocol AuthViewProtocol: AnyObject {
    func showAlert(message: String)
}

protocol AuthPresenterProtocol {
    init(view: AuthViewProtocol)
    func login(phone: String, password: String)
}

class AuthPresenter: AuthPresenterProtocol {
    
    weak var view: AuthViewProtocol?
    
    required init(view: AuthViewProtocol) {
        self.view = view
    }
    
    func login(phone: String, password: String) {
        // validate data
        view?.showAlert(message: "Fuck!")
        
        // login firebase
        print("\(phone), \(password)")
    }
}
