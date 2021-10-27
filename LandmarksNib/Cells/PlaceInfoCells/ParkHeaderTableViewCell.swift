//
//  PlaceHeaderTableViewCell.swift
//  LandmarksNib
//
//  Created by Oleksii Vasyliev on 27.10.2021.
//

import UIKit

class ParkHeaderTableViewCell: UITableViewCell {

    @IBOutlet private weak var placeImageView: UIImageView!
    @IBOutlet private weak var parkFullNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(image: String, parkName: String) {
        placeImageView.image = UIImage(named: "\(image)")
        parkFullNameLabel.text = parkName
    }
    
}
