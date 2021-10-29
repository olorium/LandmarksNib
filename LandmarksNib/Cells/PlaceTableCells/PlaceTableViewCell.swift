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
    
    func configure(name: String, parkName: String, image: String) {
        placeNameLabel.text = name
        placeParkNameLabel.text = parkName
        placeImageView.image = UIImage(named: "\(image)")
        placeImageView.contentMode = UIView.ContentMode.scaleAspectFill
        placeImageView.layer.cornerRadius = 15
    }
    
    
}
