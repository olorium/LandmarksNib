//
//  PlaceInfoTableViewCell.swift
//  LandmarksNib
//
//  Created by Oleksii Vasyliev on 27.10.2021.
//

import UIKit

final class ParkInfoTableViewCell: UITableViewCell {

    @IBOutlet private weak var parkFullDescriptionLabel: UILabel!
   
    func configure(description: String) {
        parkFullDescriptionLabel.text = description
    }
}
