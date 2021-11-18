//
//  PhotoViewController.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 18.11.2021.
//

import UIKit

class PhotoViewController: UIViewController {

    var presenter: PhotoPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Constants.UI.Colors.primary
        tabBarItem.image = UIImage(systemName: "photo")
        title = "Photo"
        
        
    }
}

extension PhotoViewController: PhotoViewProtocol {
    
}
