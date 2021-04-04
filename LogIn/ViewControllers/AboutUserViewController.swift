//
//  AboutMeViewController.swift
//  LogIn
//
//  Created by Nataly on 03.04.2021.
//

import UIKit

class AboutUserViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var hobbyLabel: UILabel!
    @IBOutlet var birthplaceLabel: UILabel!
    @IBOutlet var livingCityLabel: UILabel!
    
    @IBOutlet var moreInfoButton: UIButton!
    
    var name = ""
    var surname = ""
    var age: Int? = nil
    var hobbies: [String] = []
    var birthplace = ""
    var livingCity = ""
    var hobbyDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Name: \(name)"
        surnameLabel.text = "Surname: \(surname)"
        ageLabel.text = "Age: \(String(age ?? 0))"
        hobbyLabel.text = "Hobbies: \(hobbies.joined(separator: ", "))"
        birthplaceLabel.text = "Birthplace: \(birthplace)"
        livingCityLabel.text = "Living city: \(livingCity)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let moreAboutUserVC = segue.destination as? MoreAboutUserViewController {
            moreAboutUserVC.hobbyDescription = hobbyDescription
        }
    }
}
