//
//  ViewController.swift
//  LogIn
//
//  Created by Nataly on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    // MARK: - IB Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    // MARK: - Private properties
    private let user = "User"
    private let password = "Password"
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = user
    }
    
    // MARK: - IBActions
    @IBAction func logIn() {
        guard userNameTF.text == user, passwordTF.text == password else {
            showAlert(messege: "Please, enter correct login and passwrd.", title: "Invalid username or password!", for: passwordTF)
            return
        }
        
        performSegue(withIdentifier: "showWelcomVC", sender: nil)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(messege: "Your name is User", title: "Oops!")
        } else {
            showAlert(messege: "Your password is Password", title: "Oops!")
        }
    }
   
    // MARK: - Alert Controller
    private func showAlert(messege: String, title: String, for textField: UITextField? = nil) {
        
        let messege = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            textField?.text = ""
        }
        
        messege.addAction(okAction)
        present(messege, animated: true)
    }
    
    // MARK: - Work with keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event )
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logIn()
        }
        return true
    }
}
