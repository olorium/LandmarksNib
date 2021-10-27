//
//  ParkViewController.swift
//  LandmarksNib
//
//  Created by Oleksii Vasyliev on 27.10.2021.
//

import UIKit

enum ParkViewSections: String, CaseIterable {
    case header
    case description
}

class ParkViewController: UIViewController {

    let parkHeaderCellId = "ParkHeaderCell"
    let parkInfoCellId = "ParkInfoCell"
    var place = [Place]()
    var places: Place?
    
    @IBOutlet private weak var tableview: UITableView!
    
    var cellArray: [ParkViewSections] = [.header, .description]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        tableview.reloadData()
    }
    
    //MARK: - Registering Nibs
    private func setupTableView() {
        tableview.register(UINib.init(nibName: parkHeaderCellId, bundle: nil), forCellReuseIdentifier: parkHeaderCellId)
        tableview.register(UINib.init(nibName: parkInfoCellId, bundle: nil), forCellReuseIdentifier: parkInfoCellId)
        tableview.rowHeight = UITableView.automaticDimension
        tableview.separatorColor = UIColor.clear
    }
    
}
// MARK: - TableView delegate methods
extension ParkViewController: UITableViewDelegate {
    
}
extension ParkViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let currentItem = cellArray[indexPath.row]
        switch currentItem {
        case .header:
            let headerCell = tableview.dequeueReusableCell(withIdentifier: parkHeaderCellId, for: indexPath) as! ParkHeaderTableViewCell
            headerCell.configure(image: "icybay", parkName: "Glacier National Park")
            return headerCell
        case .description:
            let infoCell = tableView.dequeueReusableCell(withIdentifier: parkInfoCellId, for: indexPath) as! ParkInfoTableViewCell
            infoCell.configure(description: "Full Description")
            return infoCell
        }
    }
    
    
}
