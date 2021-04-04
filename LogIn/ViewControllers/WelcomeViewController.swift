//
//  WelcomeViewController.swift
//  LogIn
//
//  Created by Nataly on 31.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = """
                            Welcome,
                            \(userName)!
                            """
    }
}

