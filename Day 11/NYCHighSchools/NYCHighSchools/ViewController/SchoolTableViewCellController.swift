//
//  SchoolTableViewCellController.swift
//  NYCHighSchools
//
//  Created by Lawrence on 9/9/23.
//

import UIKit

class SchoolTableViewCellController: UITableViewCell {

    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var schoolImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
