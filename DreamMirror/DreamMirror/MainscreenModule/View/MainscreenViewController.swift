//
//  MainscreenViewController.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 16.11.2021.
//

import UIKit

class MainscreenViewController: UIViewController {

    var presenter: MainscreenPresenterProtocol!
    
    private let caloriesView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let trainingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    private let statsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    private let tipsView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.UI.Colors.shapes
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var caloriesStackView = UIStackView()
    private var mainStackView = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Constants.UI.Colors.primary
        tabBarItem.image = UIImage(systemName: "house")
        title = "Home"
        
        addSubviews()
        addConstraints()
    }
    
    func addSubviews() {
        caloriesStackView = UIStackView(arrangedSubviews: [caloriesView, trainingView],
                                        axis: .horizontal,
                                        spacing: 20,
                                        distribution: .fill)
        mainStackView = UIStackView(arrangedSubviews: [
        tipsView, statsView, caloriesStackView],
                                    axis: .vertical,
        spacing: 24,
                                    distribution: .fill)
    
        view.addSubview(mainStackView)
        view.addSubview(caloriesStackView)
    }
    
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 50),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor,
                        constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                        constant: 20),
            
            statsView.heightAnchor.constraint(equalTo: mainStackView.heightAnchor, multiplier: 0.5),
            
              
            
        ])
    }
}

extension MainscreenViewController: MainscreenViewProtocol {
    
}
