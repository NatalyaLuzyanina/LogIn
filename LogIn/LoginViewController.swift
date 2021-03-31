//
//  ViewController.swift
//  LogIn
//
//  Created by Nataly on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // подготовка экрана приветствия
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // создаем экземпляр класса вэлком, чтобы добраться через него до свойства userName
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        // добрались до свойства userName, присваеиваем ему текст введенный пользователем в поле юзернейм
        welcomeVC.userName = userName.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      //  super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    
        print("UIButton touchesBegan")
    }
    
    @IBAction func logIn() {
        guard userName.text == "User" else {
            showAlert(messege: "Wrong Username!", for: userName)
            return
        }
        guard password.text == "Password" else {
            showAlert(messege: "Wrong Password!", for: password)
            return
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        print("bla1")
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        print("bla")
        userName.text = welcomeVC.userName
        password.text = ""
    }
    
    @IBAction func showName() {
        showAlert(messege: "Your name is User", for: userName)
    }
   
    @IBAction func showPassword() {
        showAlert(messege: "Your password is 123", for: password)
    }
    
    private func showAlert(messege: String?, for textField: UITextField!) {
        
        let messege = UIAlertController(
            title: "Oops",
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
    
  
    
    
    
}


