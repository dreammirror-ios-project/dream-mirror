//
//  PhotoPresenter.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 18.11.2021.
//

import Foundation

protocol PhotoViewProtocol: AnyObject{
    func updatePhotoCollection()
}

protocol PhotoPresenterProtocol {
    init(view: PhotoViewProtocol, persistanceService: PersistanceServiceProtocol)
    
    func getPhotos()
}

class PhotoPresenter: PhotoPresenterProtocol {
    weak var view: PhotoViewProtocol?
    let persistanceService: PersistanceServiceProtocol
    
    var photos: [PhotoModel]? {
        didSet {
            view?.updatePhotoCollection()
        }
    }
    
    required init(view: PhotoViewProtocol, persistanceService: PersistanceServiceProtocol) {
        self.view = view
        self.persistanceService = persistanceService
    }
    
    func getPhotos() {
        persistanceService.getPhotos { [weak self] result in
            switch result {
            case .success(let photos):
                self?.photos = photos
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
