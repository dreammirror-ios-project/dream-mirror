//
//  ModuleBuilder.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 15.11.2021.
//

import UIKit

protocol Builder {
    static func buildAuthModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func buildAuthModule() -> UIViewController {
        let view = AuthViewController()
        let presenter = AuthPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
