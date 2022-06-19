//
//  RecepieTableViewCell.swift
//  R - concept
//
//  Created by anna on 20.05.2022.
//

import UIKit

class RecepieTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameOfTheRecepie: UILabel!
    @IBOutlet weak var descriptionOfTheRecepie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
