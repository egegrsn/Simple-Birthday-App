//
//  ProfileViewController.swift
//  BirthdayApp
//
//  Created by Ege Girsen on 19.07.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileCircle: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var initialsLbl: UILabel!
    @IBOutlet weak var goBackBtn: UIButton!
    
    var name = ""
    var age  = 0
    var initials = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = name
        ageLbl.text = "\(age) years old"
        initialsLbl.text = initials
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        profileCircle.layer.cornerRadius = profileCircle.layer.bounds.width / 2
        profileCircle.clipsToBounds = true
        goBackBtn.layer.cornerRadius = 10
    }

    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
