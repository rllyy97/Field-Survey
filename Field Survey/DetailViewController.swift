//
//  DetailViewController.swift
//  Field Survey
//
//  Created by Riley Evans on 11/14/18.
//  Copyright © 2018 Riley Evans. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var observation: Observation?
    var dateFormatter: DateFormatter?
    @IBOutlet weak var dateView: UILabel!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var descriptionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Observation"
        dateFormatter = DateFormatter()
        dateFormatter?.dateFormat = "MMMM dd, yyyy - HH:mm a"
        iconView.image = UIImage(named: observation!.classification.rawValue)
        titleView.text = observation?.title
        descriptionView.text = observation?.description
        dateView.text = dateFormatter?.string(from: observation!.date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
