//
//  UIExtensions.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 16.11.2021.
//

import UIKit

extension UITextField {
    func styleWith(_ placeholder: String) {
        self.placeholder = placeholder
        translatesAutoresizingMaskIntoConstraints = false
        borderStyle = .roundedRect
    }
}

extension UIButton {
    func stylePlainWith(_ title: String) {
        translatesAutoresizingMaskIntoConstraints = false
        configuration = .plain()
        configuration?.baseForegroundColor = Constants.UI.Colors.secondary
        configuration?.title = title
    }
}

class InvertedCollectionViewFlowLayout: UICollectionViewFlowLayout {

    // inverting the transform in the layout, rather than directly on the cell,
    // is the only way I've found to prevent cells from flipping during animated
    // cell updates

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attrs = super.layoutAttributesForItem(at: indexPath)
        attrs?.transform = CGAffineTransform(scaleX: 1, y: -1)
        return attrs
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attrsList = super.layoutAttributesForElements(in: rect)
        if let list = attrsList {
            for i in 0..<list.count {
                list[i].transform = CGAffineTransform(scaleX: 1, y: -1)
            }
        }
        return attrsList
    }
}
