//
//  PlaceInfoTableViewCell.swift
//  LandmarksNib
//
//  Created by Oleksii Vasyliev on 27.10.2021.
//

import UIKit

final class ParkInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var newTitleTextField: UITextField!
    @IBOutlet private weak var parkFullDescriptionLabel: UILabel!
   
    //MARK: - Functions
    
    func configure(description: String) {
        parkFullDescriptionLabel.text = description
    }
}
