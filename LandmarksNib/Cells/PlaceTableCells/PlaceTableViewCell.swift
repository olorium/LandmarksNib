//
//  LandmarkTableViewCell.swift
//  LandmarksNib
//
//  Created by Oleksii Vasyliev on 26.10.2021.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet private weak var placeImageView: UIImageView!
    @IBOutlet private weak var placeNameLabel: UILabel!
    @IBOutlet private weak var placeParkNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(name: String, parkName: String) {
        placeNameLabel.text = name
        placeParkNameLabel.text = parkName
    }
    
    
}
