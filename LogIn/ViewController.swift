//
//  ViewController.swift
//  LogIn
//
//  Created by Nataly on 30.03.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showName() {
        remind(credentials: "Your name is User", for: userName)
    }
   
    @IBAction func showPassword() {
        remind(credentials: "Your password is 123", for: password)
    }
    
    private func remind(credentials: String?,
                        for textField: UITextField!) {
        
        let messege = UIAlertController(
            title: "Oops",
            message: credentials,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(
            title: "OK",
            style: .default) {
            _ in textField.text = ""
        }
        
        messege.addAction(okAction)
        present(messege, animated: true)
    }
}

