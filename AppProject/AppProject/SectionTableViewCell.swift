//
//  SectionTableViewCell.swift
//  AppProject
//
//  Created by APPLE on 01/09/20.
//  Copyright © 2020 Technize. All rights reserved.
//

import UIKit

class SectionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var togbtn: UISwitch!
    @IBOutlet weak var txtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    func setCoderName(_ name: String) {
           self.txtLabel.text = name
       }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
