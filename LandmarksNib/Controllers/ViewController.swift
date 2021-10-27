//
//  ViewController.swift
//  LandmarksNib
//
//  Created by Oleksii Vasyliev on 26.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let placeCellId = "PlaceTableViewCell"
    var place = [Place]()
    
    @IBOutlet private weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //init data
        for _ in 1...25 {
            let places = Place()
            place.append(places!)
        }
        setupTableView()
        tableview.reloadData()
    }
    //MARK: - Registering Nibs
    private func setupTableView() {
        tableview.register(UINib.init(nibName: placeCellId, bundle: nil), forCellReuseIdentifier: placeCellId)
                tableview.rowHeight = UITableView.automaticDimension
                tableview.separatorColor = UIColor.clear
    }
}
//MARK: - TableView Delegates
extension ViewController: UITableViewDelegate {
    
}
extension ViewController: UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return place.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: placeCellId, for: indexPath) as! PlaceTableViewCell
        cell.configure(name: "Name", parkName: "Park Name")
        let places = place[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "fullDescription", sender: self)
    }

//MARK: - Segue method

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? ParkViewController {
//            destination.places = place[(tableView.indexPathForSelectedRow?.row)!]
//        }
//    }
}

