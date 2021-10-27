//
//  LandmarksManager.swift
//  LandmarksNib
//
//  Created by Oleksii Vasyliev on 26.10.2021.
//

//import Foundation
//
//
//final class ModelData {
//
//   var landmarks: [Landmark] = load("landmarkData.json")
//}
//
//
//
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//        else {
//            fatalError("Couldn't find \(filename) in main bundle.")
//    }
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}
import Foundation

struct LandmarksManager {
    
    func parseJSON() {
        guard let path = Bundle.main.path(forResource: "landmarkData", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        var landmark: Landmark?
        do {
            let jsonData = try Data(contentsOf: url)
            landmark = try JSONDecoder().decode(Landmark.self, from: jsonData)
            
            if let result = landmark {
                print(result)
            } else {
                print("Failed to parse")
            }
            return
        }
        catch {
            print("Error \(error)")
        }
    }
}

