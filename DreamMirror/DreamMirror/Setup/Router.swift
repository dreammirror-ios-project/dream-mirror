//
//  Router.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 16.11.2021.
//

import UIKit

protocol RouterMainProtocol {
    var navigationController: UINavigationController { get set }
    var assemblyBuilder: AssemblyBuilderProtocol { get set }
}

protocol RouterProtocol: RouterMainProtocol {
    func initialViewController()
    func showMainTabBarController()
    func popToRoot()
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController
    var assemblyBuilder: AssemblyBuilderProtocol
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        let initViewController = assemblyBuilder.buildAuthModule(router: self)
        navigationController.viewControllers = [initViewController]
    }
    
    func showMainTabBarController() {
        let mainTabViewController = setupMainTaBarController(builder: assemblyBuilder, router: self)
        navigationController.present(mainTabViewController, animated: true, completion: nil)
    }
    
    private func setupMainTaBarController(builder: AssemblyBuilderProtocol, router: RouterProtocol) -> UITabBarController {
        let tabBarViewController = UITabBarController()
        let mainscreenVC = builder.buildMainscreenModule(router: router)
        tabBarViewController.setViewControllers([mainscreenVC], animated: false)
        tabBarViewController.modalPresentationStyle = .fullScreen
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Constants.UI.Colors.primary
        
        setTabBarItemColors(appearance.stackedLayoutAppearance)
        setTabBarItemColors(appearance.inlineLayoutAppearance)
        setTabBarItemColors(appearance.compactInlineLayoutAppearance)
        
        
        tabBarViewController.tabBar.standardAppearance = appearance
        tabBarViewController.tabBar.scrollEdgeAppearance = appearance
        
        return tabBarViewController
    }
    
    private func setTabBarItemColors(_ itemAppearance: UITabBarItemAppearance) {
        itemAppearance.normal.iconColor = .lightGray
        itemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        
        itemAppearance.selected.iconColor = Constants.UI.Colors.secondary
        itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Constants.UI.Colors.secondary]
    }
    
    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
}
