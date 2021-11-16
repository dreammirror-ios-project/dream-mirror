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
    init(view: MainscreenViewProtocol)
    
}

class MainscreenPresenter: MainscreenPresenterProtocol {
    
    weak var view: MainscreenViewProtocol?
    
    required init(view: MainscreenViewProtocol) {
        self.view = view
    }
}

