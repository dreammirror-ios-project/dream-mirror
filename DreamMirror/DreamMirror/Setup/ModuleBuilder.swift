//
//  ModuleBuilder.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 15.11.2021.
//

import UIKit

protocol Builder {
    static func buildAuthModule() -> UIViewController
    static func buildMainscreenModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func buildAuthModule() -> UIViewController {
        let view = AuthViewController()
        let presenter = AuthPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func buildMainscreenModule() -> UIViewController {
        let view = MainscreenViewController()
        let presenter = MainscreenPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
