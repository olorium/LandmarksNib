//
//  Landmark.swift
//  LandmarksNib
//
//  Created by Oleksii Vasyliev on 26.10.2021.
//

import Foundation

class Landmark: Codable {
    var name: String?
    var park: String?
    var description: String?
    var imageName: String?
    required init?() {}
}
