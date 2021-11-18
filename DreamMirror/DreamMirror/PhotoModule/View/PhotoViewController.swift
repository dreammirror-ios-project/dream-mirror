//
//  PhotoViewController.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 18.11.2021.
//

import UIKit

class PhotoViewController: UIViewController {

    var presenter: PhotoPresenterProtocol!
    
    // MARK: UI privates
    private let backGround: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.UI.Colors.secondary
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Constants.UI.Colors.primary
        tabBarItem.image = UIImage(systemName: "photo")
        title = "Photo"
        
        
    }
}

extension PhotoViewController: PhotoViewProtocol {
    
}
