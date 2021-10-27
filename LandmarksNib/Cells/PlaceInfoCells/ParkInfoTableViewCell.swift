//
//  PlaceInfoTableViewCell.swift
//  LandmarksNib
//
//  Created by Oleksii Vasyliev on 27.10.2021.
//

import UIKit

class ParkInfoTableViewCell: UITableViewCell {

    @IBOutlet private weak var parkFullDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(description: String) {
        parkFullDescriptionLabel.text = description
    }
}
