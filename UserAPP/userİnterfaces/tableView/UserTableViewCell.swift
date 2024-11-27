//
//  UserTableViewCell.swift
//  UserAPP
//
//  Created by Ramin Bakhshaliyev on 06.09.24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var LableUserName: UILabel!
    @IBOutlet weak var LableUserPhone: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
