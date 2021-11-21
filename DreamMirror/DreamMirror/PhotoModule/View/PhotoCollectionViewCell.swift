//
//  PhotoCollectionViewCell.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 18.11.2021.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    
    static let identifier = "PhotoCollectionViewCellIdentifier"
    static let nibName = "PhotoCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .systemTeal
        photoImageView.backgroundColor = .systemGreen
    }
    
    func confifureCellWith(_ photoModel: PhotoModel) {
        dayLabel.text = String(Calendar.current.component(.day, from: photoModel.photoDate))
    }

}
