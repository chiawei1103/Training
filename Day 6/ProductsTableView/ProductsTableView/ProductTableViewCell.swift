//
//  ProductTableViewCell.swift
//  ProductsTableView
//
//  Created by Consultant on 8/30/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    
    var images = [UIImageView]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        images = [image1, image2, image3, image4, image5]
        thumbnailImage.layer.borderWidth = 3
        thumbnailImage.layer.borderColor = UIColor.white.cgColor
        thumbnailImage.layer.cornerRadius = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
