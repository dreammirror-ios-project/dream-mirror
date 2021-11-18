//
//  ModuleBuilder.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 15.11.2021.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func buildAuthModule(router: RouterProtocol) -> UIViewController
    func buildMainscreenModule(router: RouterProtocol) -> UIViewController
    func buildSignUpModule(router: RouterProtocol) -> UIViewController
    func buildPhotoModule(router: RouterProtocol) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    func buildSignUpModule(router: RouterProtocol) -> UIViewController {
        let view = SignUpViewController()
        let presenter = SignUpPresenter(view: view, router: router)
        view.presenter = presenter
        return view 
    }
    
    func buildAuthModule(router: RouterProtocol) -> UIViewController {
        let view = AuthViewController()
        let presenter = AuthPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func buildMainscreenModule(router: RouterProtocol) -> UIViewController {
        let view = MainscreenViewController()
        let presenter = MainscreenPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func buildPhotoModule(router: RouterProtocol) -> UIViewController {
        let view = PhotoViewController()
        let coreDataManager = CoreDataManager()
        let presenter = PhotoPresenter(view: view, persistanceService: coreDataManager)
        view.presenter = presenter
        return view
    }
}
