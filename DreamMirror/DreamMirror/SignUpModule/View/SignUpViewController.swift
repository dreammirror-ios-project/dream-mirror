//
//  SignUpViewController.swift
//  DreamMirror
//
//  Created by Андрей Суханов on 15.11.2021.
//

import UIKit


class SignUpViewController: UIViewController {

    var presenter: SignUpPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.UI.Colors.primary
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SignUpViewController: SignUpViewProtocol {
    func showAlert(message: String) {
        let alert = AlertService.alert(title: nil, message: message)
        present(alert, animated: true, completion: nil)
    }
}
