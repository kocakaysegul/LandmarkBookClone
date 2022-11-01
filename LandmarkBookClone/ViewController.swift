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
    
    var chosenLandmarkName = ""
    var chosenLandMarkImage = UIImage()
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkName[indexPath.row]
        chosenLandMarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as? DetailsViewController
            destinationVC?.selectedLandmarkImage = chosenLandMarkImage
            destinationVC?.selectedLandmarkName = chosenLandmarkName
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkName.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }

}

