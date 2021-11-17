//
//  AlertService.swift
//  DreamMirror
//
//  Created by Максим Тараканов on 15.11.2021.
//

import UIKit

class AlertService {
    static func alert(title: String? = nil, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ок", style: .default, handler: nil)
        alert.addAction(alertAction)
        return alert
    }
}
