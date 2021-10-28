//
//  Landmark.swift
//  LandmarksNib
//
//  Created by Oleksii Vasyliev on 26.10.2021.
//

import Foundation

class Items: Codable {
    var name: String?
    var park: String?
    var description: String?
    var imageName: String?
    required init?() {}
}


struct Place: Codable {
    var name: String
    var park: String
    var description: String
    var imageName: String
}
