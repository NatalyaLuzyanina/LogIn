//
//  ViewController.swift
//  LogIn
//
//  Created by Nataly on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userName.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func logIn() {
        guard userName.text == "User", password.text == "Password" else {
            showAlert(messege: "Please, enter correct login and passwrd.", title: "Invalid username or password!", for: password)
            return
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        userName.text = ""
        password.text = ""
    }
    
    @IBAction func showName() {
        showAlert(messege: "Your name is User", title: "Oops!", for: userName)
    }
    
    @IBAction func showPassword() {
        showAlert(messege: "Your password is Password", title: "Oops!", for: password)
    }
   
    private func showAlert(messege: String?, title: String, for textField: UITextField!) {
        
        let messege = UIAlertController(
            title: title,
            message: messege,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(
            title: "OK",
            style: .default) {
            _ in textField.text = ""
        }
        
        messege.addAction(okAction)
        present(messege, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
            if textField == userName {
                password.becomeFirstResponder()
            }
            return true
    }
}
