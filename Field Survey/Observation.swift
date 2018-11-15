//
//  Observation.swift
//  Field Survey
//
//  Created by Riley Evans on 11/14/18.
//  Copyright © 2018 Riley Evans. All rights reserved.
//

import Foundation

struct Observation {
    let classification: Class
    let title: String
    let description: String
    let date: Date
    
    init(_ classification: Class, _ title: String, _ description: String, _ date: Date) {
        self.classification = classification
        self.title = title
        self.description = description
        self.date = date
    }
}
