//
//  WelcomeViewController.swift
//  LogIn
//
//  Created by Nataly on 31.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    // создаем переменную, чтобы передать в нее данные из логинВьюКонтроллер (сразу в welcomeLabel не получится тк вьюдидлоад еще не сработал и welcomeLabel = нил
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(userName ?? "")!"
    }


}
