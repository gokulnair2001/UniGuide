//
//  suggestedTableViewCell.swift
//  UniGuide
//
//  Created by Gokul Nair on 14/04/21.
//

import UIKit

class suggestedTableViewCell: UITableViewCell {

    @IBOutlet weak var bookImg: UIImageView!
    @IBOutlet weak var projName: UILabel!
    @IBOutlet weak var projCode: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
