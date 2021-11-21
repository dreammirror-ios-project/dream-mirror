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
    
    private let photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 45, height: 60)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(UINib(nibName: PhotoCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
//        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.backgroundColor = .systemRed
        return collection
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
        title = "Фото"
        
        progressBarConstraintStart = progressBar.widthAnchor.constraint(equalTo: progressBarBack.widthAnchor, multiplier: 0.1)
        progressBarConstraintProgress = progressBar.widthAnchor.constraint(equalTo: progressBarBack.widthAnchor, multiplier: 0.8)
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(background)
        background.addSubview(photoCollectionView)
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
            
            photoCollectionView.topAnchor.constraint(equalTo: background.topAnchor, constant: 20),
            photoCollectionView.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -20),
            photoCollectionView.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 20),
            photoCollectionView.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -20),
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        presenter.getPhotos()
    }
}

extension PhotoViewController: PhotoViewProtocol {
    func updatePhotoCollection() {
        photoCollectionView.reloadData()
    }
}

extension PhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        cell.confifureCellWith(presenter.photos[indexPath.row])
//        cell.contentView.backgroundColor = .systemBlue
        return cell
    }
}

extension PhotoViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            return CGSize(width: 90, height: 150)
        }
}
