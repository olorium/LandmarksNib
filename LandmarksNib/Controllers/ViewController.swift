//
//  ViewController.swift
//  LandmarksNib
//
//  Created by Oleksii Vasyliev on 26.10.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var bottomUILabel: UILabel!
    
    //MARK: - Properties
    
    let placeCellId = "PlaceTableViewCell"
    private var places: [Place] = []
    let controller = ParkViewController()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        controller.parkViewControllerDelegate = self
        navigationBar.title = "Places"
        setupTableView()
        fetchData()
    }

//MARK: - Methods
    private func fetchData() {
        AF.request("https://slashapp.dev/api/landmarkData.json", method: .get).responseDecodable(of: [Place].self) { response in
            self.places = response.value ?? []
            self.tableView.reloadData()
        }
    }
    
//MARK: - Registering Nibs
    private func setupTableView() {
        tableView.register(UINib.init(nibName: placeCellId, bundle: nil), forCellReuseIdentifier: placeCellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.clear
    }
}
//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: placeCellId, for: indexPath) as! PlaceTableViewCell
        cell.configure(name: places[indexPath.row].name, parkName: places[indexPath.row].park, image: places[indexPath.row].imageName)
        //let places = place[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "fullDescription", sender: self)
    }

//MARK: - Segue method

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ParkViewController {
            destination.parkName = places[(tableView.indexPathForSelectedRow?.row)!].park
            destination.parkImage = places[(tableView.indexPathForSelectedRow?.row)!].imageName
            destination.parkDescription = places[(tableView.indexPathForSelectedRow?.row)!].description
        }
    }
}
//MARK: - Delegates

extension ViewController: ParkViewControllerDelegate {
    func didSetTitle(_ newTitle: String) {
        bottomUILabel.text = newTitle
        navigationBar.title = newTitle
    }
}
