//
//  MoreAboutUserViewController.swift
//  LogIn
//
//  Created by Nataly on 04.04.2021.
//

import UIKit

class MoreAboutUserViewController: UIViewController {
    
    @IBOutlet var hobbyDescriptionLabel: UILabel!
    
    var hobbyDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hobbyDescriptionLabel.text = hobbyDescription
    }
}
