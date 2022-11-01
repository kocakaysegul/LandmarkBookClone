//
//  ViewController.swift
//  LandmarkBookClone
//
//  Created by Ayşegül Koçak on 1.11.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkName = [String]()
    var landmarkImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkName.append("Colosseum")
        landmarkName.append("Great Wall")
        landmarkName.append("Kremline")
        landmarkName.append("Stonehenge")
        landmarkName.append("Taj Mahal")
        
        
        landmarkImages.append(UIImage(named: "colosseum")!)
        landmarkImages.append(UIImage(named: "greatWall")!)
        landmarkImages.append(UIImage(named: "kremline")!)
        landmarkImages.append(UIImage(named: "stonehenge")!)
        landmarkImages.append(UIImage(named: "tajmahal")!)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkName.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = "test" // It will be depracated
        var content = cell.defaultContentConfiguration()
        content.text = landmarkName[indexPath.row]
        //content.secondaryText = "Subtitle"
        cell.contentConfiguration = content
        return cell
    }

}

