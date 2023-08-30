//
//  StudentCell.swift
//  LoginTableView
//
//  Created by Consultant on 8/29/23.
//

import UIKit

class StudentCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatar.layer.cornerRadius = avatar.frame.size.width / 2
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
