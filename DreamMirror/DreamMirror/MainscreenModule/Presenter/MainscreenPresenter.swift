//
//  MainscreenPresenter.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 16.11.2021.
//

import Foundation

protocol MainscreenViewProtocol: AnyObject {
    
}

protocol MainscreenPresenterProtocol {
    init(view: MainscreenViewProtocol, router: RouterProtocol)
    
}

class MainscreenPresenter: MainscreenPresenterProtocol {
    
    weak var view: MainscreenViewProtocol?
    var router: RouterProtocol
    
    required init(view: MainscreenViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
}

