//
//  CustomeTableViewCell.swift
//  ExampleOne
//
//  Created by Shaik Ghouse Basha on 3/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class CustomeTableViewCell: UITableViewCell {

    @IBOutlet weak var mMenuItemLabel: UILabel!
    @IBOutlet weak var mAlbumImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
