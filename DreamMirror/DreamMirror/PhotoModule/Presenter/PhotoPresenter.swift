//
//  PhotoPresenter.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 18.11.2021.
//

import Foundation

protocol PhotoViewProtocol: AnyObject{
    
}

protocol PhotoPresenterProtocol {
    init(view: PhotoViewProtocol)
}

class PhotoPresenter: PhotoPresenterProtocol {
    weak var view: PhotoViewProtocol?
    
    required init(view: PhotoViewProtocol) {
        self.view = view
    }
}
