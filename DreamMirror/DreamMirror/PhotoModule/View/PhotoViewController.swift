//
//  PhotoViewController.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 18.11.2021.
//

import UIKit

class PhotoViewController: UIViewController {

    var presenter: PhotoPresenterProtocol!
    
    // MARK: - UI privates
    private let background: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.UI.Colors.secondary
        return view
    }()
    
    private let progressBarBack: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()
    
    private let progressBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemOrange
        return view
    }()
    
    // MARK: - StackViews
    
    
    // MARK: - Constraints
    
    var progressBarConstraintStart: NSLayoutConstraint!
    var progressBarConstraintProgress: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Constants.UI.Colors.primary
        tabBarItem.image = UIImage(systemName: "photo")
        title = "Photo"
        progressBarConstraintStart = progressBar.widthAnchor.constraint(equalTo: progressBarBack.widthAnchor, multiplier: 0.1)
        progressBarConstraintProgress = progressBar.widthAnchor.constraint(equalTo: progressBarBack.widthAnchor, multiplier: 0.8)
        
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(background)
        view.addSubview(progressBarBack)
        progressBarBack.addSubview(progressBar)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            background.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            background.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            background.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            background.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            progressBarBack.heightAnchor.constraint(equalToConstant: 20),
            progressBarBack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            progressBarBack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
            progressBarBack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            progressBarConstraintStart,
            progressBar.leadingAnchor.constraint(equalTo: progressBarBack.leadingAnchor, constant: 0),
            progressBar.heightAnchor.constraint(equalTo: progressBarBack.heightAnchor),
            
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        progressBar.layer.cornerRadius = progressBarBack.frame.height / 2
        progressBarBack.layer.cornerRadius = progressBarBack.frame.height / 2
        background.layer.cornerRadius = 15
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut) { [weak self] in
            self?.progressBarConstraintStart.isActive = false
            self?.progressBarConstraintProgress.isActive = true
            self?.view.layoutIfNeeded()
        }
    }
}

extension PhotoViewController: PhotoViewProtocol {
    func updatePhotoCollection() {
        
    }
}
