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
        configuration?.title = title
    }
}
