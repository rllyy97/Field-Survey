//
//  ViewController.swift
//  Field Survey
//
//  Created by Riley Evans on 11/14/18.
//  Copyright © 2018 Riley Evans. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var observationList = jsonLoader.load(fileName: "field_observations")
    let dateFormatter = DateFormatter()
    @IBOutlet weak var observationsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Field Survey"
        dateFormatter.dateFormat = "MMMM dd, yyyy - HH:mm a"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return observationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "observationCell", for: indexPath)
        if let cell = cell as? ObservationCell {
            let observation = observationList[indexPath.row]
            cell.iconView.image = UIImage(named: observation.classification.rawValue)
            cell.titleView.text = observation.title
            cell.dateView.text = dateFormatter.string(from: observation.date)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController,
            let row = observationsTableView.indexPathForSelectedRow?.row{
            destination.observation = observationList[row]
        }
        
    }

}

