//
//  ViewController.swift
//  LandmarksNib
//
//  Created by Oleksii Vasyliev on 26.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let landmarkCellId = "LandmarkTableViewCell"
    var landmark = [Landmark]()
    
    @IBOutlet private weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // register cell
        tableview.register(UINib.init(nibName: landmarkCellId, bundle: nil), forCellReuseIdentifier: landmarkCellId)
        tableview.rowHeight = UITableView.automaticDimension
        tableview.separatorColor = UIColor.clear
        
        //init data
        for _ in 1...25 {
            var landmarks = Landmark()
            landmark.append(landmarks!)
        }
        tableview.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    
}
extension ViewController: UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmark.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: landmarkCellId, for: indexPath) as! LandmarkTableViewCell
        cell.configure(name: "Name", parkName: "Park Name")
        let landmarks = landmark[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let landmarks = landmark[indexPath.row]
        print("\(indexPath.row) - \(landmarks.name!)")
    }

}

