//
//  MainscreenViewController.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 16.11.2021.
//

import UIKit

class MainscreenViewController: UIViewController {

    var presenter: MainscreenPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Constants.UI.Colors.primary
        tabBarItem.image = UIImage(systemName: "house")
        title = "Home"
        // tabBarItem.imageInsets = .init(top: 5, left: 0, bottom: -5, right: 0)
        // Do any additional setup after loading the view.
    }
    

}

extension MainscreenViewController: MainscreenViewProtocol {
    
}
