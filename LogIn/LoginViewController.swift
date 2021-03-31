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
        
       // userName.delegate = self
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
        guard segue.source is WelcomeViewController else { return }
        userName.text = ""
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

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
                nextField.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
                print("1")
                return true;
            }
        print("2")
            return false
        }
        
}

//extension LoginViewController: UITextViewDelegate {
//
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if (text == "\n") {
//            textView.resignFirstResponder()
//        }
//        return true
//    }
//}

/*
 print("123")
 if (textField.text?.isEmpty != nil) {
     print("ghjkl;'")
     textField.resignFirstResponder()
     logIn()
 */
