//
//  PersonCell.swift
//  BirthdayApp
//
//  Created by Ege Girsen on 19.07.2022.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var initialsLbl: UILabel!
    @IBOutlet weak var profileCircle: UIView!
    
    var personViewModel:PersonViewModel! {
        didSet{
            nameLbl?.text = personViewModel.fullname
            dateLbl?.text = personViewModel.dob
            initialsLbl?.text = personViewModel.initials
        }
    }
    override func layoutSubviews() {
           super.layoutSubviews()
            profileCircle.layer.cornerRadius = profileCircle.layer.bounds.width / 2
            profileCircle.clipsToBounds = true
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            //fatalError("init(coder:) has not been implemented")
          }

}
