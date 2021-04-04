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
    private let user = User.getUser()
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        
        for viewController in tabBarController.viewControllers! {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = "\(user.person.name) \(user.person.surname)"
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutUserVC = navigationVC.topViewController as! AboutUserViewController
                aboutUserVC.name = user.person.name
                aboutUserVC.surname = user.person.surname
                aboutUserVC.age = user.person.age
                aboutUserVC.hobbies = user.person.hobbies
                aboutUserVC.birthplace = user.person.birthplace
                aboutUserVC.livingCity = user.person.livingCity
                aboutUserVC.hobbyDescription = user.person.hobbyDescription
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func logIn() {
        guard userNameTF.text == user.login, passwordTF.text == user.password else {
            showAlert(messege: "Please, enter correct login and password.", title: "Invalid username or password!", for: passwordTF)
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
            showAlert(messege: "Your name is \(user.login))", title: "Oops!")
        } else {
            showAlert(messege: "Your password is \(user.password)", title: "Oops!")
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
