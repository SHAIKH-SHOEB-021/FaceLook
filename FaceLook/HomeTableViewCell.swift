//
//  HomeTableViewCell.swift
//  FaceLook
//
//  Created by shoeb on 14/01/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var homeImageCell: UIImageView!
    @IBOutlet weak var idTXT: UILabel!
    @IBOutlet weak var firstNameTXT: UILabel!
    @IBOutlet weak var lastNameTXT: UILabel!
    @IBOutlet weak var emailTXT: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
