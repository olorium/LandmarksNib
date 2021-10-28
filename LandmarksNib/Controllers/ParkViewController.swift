//
//  ParkViewController.swift
//  LandmarksNib
//
//  Created by Oleksii Vasyliev on 27.10.2021.
//

// Создать UITextField на втором экране
// Напечатать в нем текст
// Нажать Save в navigationBar
// передать этот текс в navigationTitle в первом экране

import UIKit

enum ParkViewSections: String, CaseIterable {
    case header
    case description
}

class ParkViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    let parkHeaderCellId = "ParkHeaderTableViewCell"
    let parkInfoCellId = "ParkInfoTableViewCell"
    var parkName = ""
    var parkImage = ""
    var parkDescription = ""
    
    var cellArray: [ParkViewSections] = [.header, .description]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupTableView()
    }
    
    // MARK: - Methods

    
    //MARK: - Registering Nibs
    
    private func setupTableView() {
        tableView.register(UINib.init(nibName: parkHeaderCellId, bundle: nil), forCellReuseIdentifier: parkHeaderCellId)
        tableView.register(UINib.init(nibName: parkInfoCellId, bundle: nil), forCellReuseIdentifier: parkInfoCellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.clear
    }
}

// MARK: - UITableViewDelegate

extension ParkViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension ParkViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentItem = cellArray[indexPath.row]
        switch currentItem {
        case .header:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: parkHeaderCellId, for: indexPath) as! ParkHeaderTableViewCell
            headerCell.configure(image: parkImage, parkName: parkName)
            return headerCell
        case .description:
            let infoCell = tableView.dequeueReusableCell(withIdentifier: parkInfoCellId, for: indexPath) as! ParkInfoTableViewCell
            infoCell.configure(description: parkDescription)
            return infoCell
        }
    }
}
